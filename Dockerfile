# Dockerfile for Flutter Web Application - Escape
# Multi-stage build for optimized production image

# =============================================================================
# Stage 1: Build the Flutter web application
# =============================================================================
FROM ghcr.io/cirruslabs/flutter:3.27.0 AS build

# Set working directory
WORKDIR /app

# Copy pubspec files first for better caching
COPY pubspec.yaml pubspec.lock ./

# Copy local dependencies
COPY dependencies/ dependencies/

# Get dependencies
RUN flutter pub get

# Copy the rest of the application
COPY . .

# Build the Flutter web application
RUN flutter build web --release

# =============================================================================
# Stage 2: Serve the built application with nginx
# =============================================================================
FROM nginx:alpine AS production

# Copy nginx configuration
COPY docker/nginx.conf /etc/nginx/nginx.conf

# Copy built web files from build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost:80/ || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
