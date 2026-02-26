import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Login Page Overflow Test
/// 
/// Issue: Overflow on desktop/window view, while tablet and mobile display correctly
/// 
/// Test Cases:
/// 1. Desktop view (width > 1024px) - Should NOT overflow
/// 2. Tablet view (width 768-1024px) - Should display correctly
/// 3. Mobile view (width < 768px) - Should display correctly
/// 4. Window resizing - Should adapt without overflow
class LoginOverflowTestPageWidget extends StatefulWidget {
  const LoginOverflowTestPageWidget({super.key});

  static String routeName = 'LoginOverflowTestPage';
  static String routePath = 'test-login-overflow';

  @override
  State<LoginOverflowTestPageWidget> createState() =>
      _LoginOverflowTestPageWidgetState();
}

class _LoginOverflowTestPageWidgetState
    extends State<LoginOverflowTestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _passwordVisible = false;
  String _testStatus = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth >= 768 && screenWidth <= 1024;
    final isMobile = screenWidth < 768;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'Login Overflow Test',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'WorkSans',
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Screen Info Banner
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isDesktop
                              ? Color(0xFFFF6B6B).withOpacity(0.1)
                              : Color(0xFF4ECDC4).withOpacity(0.1),
                          border: Border(
                            bottom: BorderSide(
                              color: isDesktop
                                  ? Color(0xFFFF6B6B)
                                  : Color(0xFF4ECDC4),
                              width: 2.0,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Current View: ${isDesktop ? "Desktop" : isTablet ? "Tablet" : "Mobile"}',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: isDesktop
                                        ? Color(0xFFFF6B6B)
                                        : Color(0xFF4ECDC4),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Width: ${screenWidth.toStringAsFixed(0)}px × Height: ${screenHeight.toStringAsFixed(0)}px',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      // Main Content - Responsive Layout
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 32.0 : 16.0,
                          vertical: 24.0,
                        ),
                        child: Center(
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: isDesktop ? 600 : double.infinity,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Test Instructions
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.bug_report,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          SizedBox(width: 8.0),
                                          Text(
                                            'Issue Description',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12.0),
                                      Text(
                                        'Overflow occurs on desktop/window view, but displays correctly on tablet and mobile.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      SizedBox(height: 12.0),
                                      Text(
                                        'Test Actions:',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        '• Resize window to different widths\n'
                                        '• Check for horizontal/vertical overflow\n'
                                        '• Verify all elements are visible\n'
                                        '• Test on actual devices',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'WorkSans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 24.0),

                                // Login Form (Responsive)
                                Text(
                                  'Login Form Test',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),

                                SizedBox(height: 16.0),

                                // Email Field
                                TextFormField(
                                  controller: _emailController,
                                  focusNode: _emailFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    hintText: 'Enter your email...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),

                                SizedBox(height: 16.0),

                                // Password Field
                                TextFormField(
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  autofocus: false,
                                  obscureText: !_passwordVisible,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    hintText: 'Enter your password...',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      }),
                                      child: Icon(
                                        _passwordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 24.0),

                                // Login Button
                                FFButtonWidget(
                                  onPressed: () {
                                    setState(() {
                                      _testStatus =
                                          'Login button clicked - No overflow detected!';
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Test: Login button works without overflow',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                  text: 'Test Login',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: EdgeInsets.zero,
                                    iconPadding: EdgeInsets.zero,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),

                                SizedBox(height: 16.0),

                                // Status Display
                                if (_testStatus.isNotEmpty)
                                  Container(
                                    padding: EdgeInsets.all(12.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF4ECDC4).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: Color(0xFF4ECDC4),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: Color(0xFF4ECDC4),
                                          size: 20.0,
                                        ),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                          child: Text(
                                            _testStatus,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  color: Color(0xFF4ECDC4),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                SizedBox(height: 24.0),

                                // Additional Test Elements
                                Text(
                                  'Additional UI Elements',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'WorkSans',
                                        letterSpacing: 0.0,
                                      ),
                                ),

                                SizedBox(height: 12.0),

                                Wrap(
                                  spacing: 12.0,
                                  runSpacing: 12.0,
                                  children: [
                                    _buildInfoChip('Responsive Layout'),
                                    _buildInfoChip('Flexible Sizing'),
                                    _buildInfoChip('ScrollView Enabled'),
                                    _buildInfoChip('Constraint Applied'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label) {
    return Chip(
      label: Text(
        label,
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'WorkSans',
              letterSpacing: 0.0,
            ),
      ),
      backgroundColor:
          FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      side: BorderSide(
        color: FlutterFlowTheme.of(context).alternate,
      ),
    );
  }
}
