import SwiftUI

// Ported from shared.tsx: RingTimer, ControlBar, MiniPlayer.

// MARK: - RingTimer

@available(iOS 17.0, *)
public struct RingTimer: View {
    let seconds: Int
    let totalSeconds: Int
    let caption: String

    public init(seconds: Int, totalSeconds: Int = 25 * 60, caption: String = "Short break at 12:11 PM") {
        self.seconds = seconds
        self.totalSeconds = totalSeconds
        self.caption = caption
    }

    private let size: CGFloat = 260
    private let stroke: CGFloat = 6

    private var progress: Double {
        guard totalSeconds > 0 else { return 0 }
        return max(0, min(1, 1 - Double(seconds) / Double(totalSeconds)))
    }

    private var mins: Int { max(0, seconds) / 60 }
    private var secs: Int { max(0, seconds) % 60 }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(Esc.hairline, lineWidth: stroke)
                .frame(width: size - stroke * 2, height: size - stroke * 2)
            // A zero-length SVG dash with round caps still draws a dot, so never trim to exactly 0.
            Circle()
                .trim(from: 0, to: max(progress, 0.0001))
                .stroke(LinearGradient(colors: [Esc.ember, Esc.ember2], startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: stroke, lineCap: .round))
                .frame(width: size - stroke * 2, height: size - stroke * 2)
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 1), value: progress)
            VStack(spacing: 4) {
                Text(String(format: "%02d:%02d", mins, secs))
                    .font(EscFont.display(48))
                    .foregroundStyle(Esc.mist)
                    .frame(height: 48)
                Text(caption)
                    .font(EscFont.ui(12))
                    .foregroundStyle(Esc.haze)
            }
        }
        .frame(width: size, height: size)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(mins) minutes \(secs) seconds remaining")
        .accessibilityAddTraits(.updatesFrequently)
    }
}

// MARK: - ControlBar

@available(iOS 17.0, *)
public struct ControlBar: View {
    let isPlaying: Bool
    let isSaved: Bool
    let onPlayPause: (() -> Void)?
    let onTimer: (() -> Void)?
    let onModeChange: (() -> Void)?
    let onSave: (() -> Void)?
    let onShare: (() -> Void)?

    public init(isPlaying: Bool, isSaved: Bool = false, onPlayPause: (() -> Void)? = nil, onTimer: (() -> Void)? = nil,
                onModeChange: (() -> Void)? = nil, onSave: (() -> Void)? = nil, onShare: (() -> Void)? = nil) {
        self.isPlaying = isPlaying
        self.isSaved = isSaved
        self.onPlayPause = onPlayPause
        self.onTimer = onTimer
        self.onModeChange = onModeChange
        self.onSave = onSave
        self.onShare = onShare
    }

    public var body: some View {
        HStack(spacing: 0) {
            iconButton(.shuffle, label: "New variation", action: onModeChange)
            Spacer(minLength: 0)
            iconButton(.timer, label: "Timer", action: onTimer)
            Spacer(minLength: 0)
            playButton
            Spacer(minLength: 0)
            iconButton(isSaved ? .check : .bookmark,
                       label: isSaved ? "Saved" : "Save",
                       color: isSaved ? Esc.lilac : Esc.haze,
                       selected: isSaved,
                       action: onSave)
            Spacer(minLength: 0)
            iconButton(.share, label: "Share moment", action: onShare)
        }
        .padding(.horizontal, 8)
        .frame(maxWidth: .infinity)
    }

    private func iconButton(_ icon: EscIcon, label: String, color: Color = Esc.haze,
                            selected: Bool = false, action: (() -> Void)?) -> some View {
        Button { action?() } label: {
            Icon(icon, size: 22, color: color)
                .frame(width: 48, height: 48)
                .contentShape(Rectangle())
        }
        .buttonStyle(EscPressStyle())
        .disabled(selected)
        .accessibilityLabel(label)
        .accessibilityAddTraits(selected ? .isSelected : [])
    }

    private var playButton: some View {
        Button { onPlayPause?() } label: {
            Circle()
                .fill(LinearGradient.css(135, [Esc.ember, Esc.ember2]))
                .frame(width: 72, height: 72)
                .shadow(color: Color(hex: 0xEF7702, opacity: 0.4), radius: 12)
                .overlay(Icon(isPlaying ? .pause : .play, size: 26, color: .white))
                .contentShape(Circle())
        }
        .buttonStyle(EscPressStyle())
        .accessibilityLabel(isPlaying ? "Pause" : "Play")
    }
}

// MARK: - MiniPlayer

/// The floating bar only. It includes its 16 pt side insets; the screen pins it to the bottom,
/// 72 pt above the bottom edge of the content (i.e. on top of the BottomNavBar).
@available(iOS 17.0, *)
public struct MiniPlayer: View {
    let mode: String
    let isPlaying: Bool
    let onPress: (() -> Void)?
    let onPlayPause: (() -> Void)?
    let onTimer: (() -> Void)?

    public init(mode: String, isPlaying: Bool, onPress: (() -> Void)? = nil,
                onPlayPause: (() -> Void)? = nil, onTimer: (() -> Void)? = nil) {
        self.mode = mode
        self.isPlaying = isPlaying
        self.onPress = onPress
        self.onPlayPause = onPlayPause
        self.onTimer = onTimer
    }

    public var body: some View {
        HStack(spacing: 12) {
            Button { onPress?() } label: { info }
                .buttonStyle(EscPressStyle())
            Button { onTimer?() } label: {
                Icon(.timer, size: 20, color: Esc.haze)
                    .padding(8)
                    .contentShape(Rectangle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityLabel("Timer")
            Button { onPlayPause?() } label: {
                Circle()
                    .fill(Esc.ember)
                    .frame(width: 36, height: 36)
                    .overlay(Icon(isPlaying ? .pause : .play, size: 14, color: .white))
                    .contentShape(Circle())
            }
            .buttonStyle(EscPressStyle())
            .accessibilityLabel(isPlaying ? "Pause" : "Play")
        }
        .padding(.vertical, 11)
        .padding(.horizontal, 17)
        .background(Color(hex: 0x212C5A, opacity: 0.92), in: RoundedRectangle(cornerRadius: 16))
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Esc.hairline, lineWidth: 1))
        .padding(.horizontal, 16)
    }

    private var info: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(RadialGradient.cssCircle([Color(hex: 0xB9A3F0, opacity: 0.3), Color(hex: 0x8E7CD9, opacity: 0.1)], box: 36))
                .overlay(Circle().strokeBorder(Color(hex: 0xB9A3F0, opacity: 0.4), lineWidth: 1))
                .overlay(Icon(.soundwave, size: 16, color: Esc.lilac))
                .frame(width: 36, height: 36)
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 6) {
                    Text((isPlaying ? "Generating · " : "") + mode)
                        .font(EscFont.ui(13, .semibold))
                        .foregroundStyle(Esc.mist)
                    if isPlaying {
                        MiniEqualizer()
                    }
                }
                Text("Composed by Lucille (AI)")
                    .font(EscFont.ui(11))
                    .foregroundStyle(Esc.haze)
            }
            .lineLimit(1)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
    }
}

/// MiniPlayer's eq bars: 2 pt wide, 2 pt apart, centred in a 12 pt row (differs from EqualizerBars).
@available(iOS 17.0, *)
private struct MiniEqualizer: View {
    @State private var on = false
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            bar(from: 4, to: 12, period: 0.8)
            bar(from: 8, to: 4, period: 0.6)
            bar(from: 6, to: 14, period: 1.0)
        }
        .frame(height: 12)
        .onAppear { on = !reduceMotion }
        .accessibilityHidden(true)
    }

    private func bar(from: CGFloat, to: CGFloat, period: Double) -> some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(Esc.lilac)
            .frame(width: 2, height: on ? to : from)
            .animation(on ? .easeInOut(duration: period / 2).repeatForever(autoreverses: true) : .default, value: on)
    }
}

// MARK: - Previews

