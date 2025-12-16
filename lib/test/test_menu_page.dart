import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_overflow_test_page.dart';
import 'signup_flow_test_page.dart';
import 'email_validation_test_page.dart';

/// Test Menu Page
/// 
/// This page provides access to various test scenarios for the Login/Signup flow.
/// Each test page demonstrates and validates specific issues:
/// 
/// 1. Login Page Overflow Test - Tests desktop/window view overflow issues
/// 2. Signup Flow Test - Tests text field clearing and redirect after signup
/// 3. Email Validation Test - Tests email verification and duplicate prevention
class TestMenuPageWidget extends StatefulWidget {
  const TestMenuPageWidget({super.key});

  static String routeName = 'TestMenuPage';
  static String routePath = 'test-menu';

  @override
  State<TestMenuPageWidget> createState() => _TestMenuPageWidgetState();
}

class _TestMenuPageWidgetState extends State<TestMenuPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
            'Login/Signup Flow Tests',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'WorkSans',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Text(
                    'Test Suite Menu',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 24.0),
                    child: Text(
                      'Select a test scenario to validate Login/Signup flow issues',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),

                  // Test 1: Login Overflow
                  _buildTestCard(
                    context: context,
                    title: '1. Login Page Overflow Test',
                    description:
                        'Tests overflow issue on desktop/window view. The layout should display correctly on all screen sizes.',
                    icon: Icons.desktop_windows,
                    color: Color(0xFFFF6B6B),
                    onTap: () {
                      context.pushNamed(LoginOverflowTestPageWidget.routeName);
                    },
                  ),

                  SizedBox(height: 16.0),

                  // Test 2: Signup Flow
                  _buildTestCard(
                    context: context,
                    title: '2. Signup Flow Test',
                    description:
                        'Tests text field clearing after signup and redirect to login screen with confirmation message.',
                    icon: Icons.app_registration,
                    color: Color(0xFF4ECDC4),
                    onTap: () {
                      context.pushNamed(SignupFlowTestPageWidget.routeName);
                    },
                  ),

                  SizedBox(height: 16.0),

                  // Test 3: Email Validation
                  _buildTestCard(
                    context: context,
                    title: '3. Email Validation Test',
                    description:
                        'Tests email verification, duplicate detection, and invalid email prevention during signup.',
                    icon: Icons.email_outlined,
                    color: Color(0xFFFFE66D),
                    onTap: () {
                      context.pushNamed(EmailValidationTestPageWidget.routeName);
                    },
                  ),

                  SizedBox(height: 32.0),

                  // Additional Test Info
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Test Instructions',
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
                          '• Each test page contains specific scenarios to reproduce the reported issues\n'
                          '• Test on different screen sizes (mobile, tablet, desktop)\n'
                          '• Check console logs for validation errors\n'
                          '• Verify Firebase Auth interactions\n'
                          '• Note any unexpected behavior',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestCard({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2.0,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x1A000000),
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Icon(
                icon,
                color: color,
                size: 32.0,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
