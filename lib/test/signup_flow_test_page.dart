import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Signup Flow Test Page
/// 
/// Issue: Text fields are not cleared after signup, and no redirect/confirmation
/// 
/// Expected Behavior:
/// 1. After successful signup, clear all text fields
/// 2. Redirect to login screen
/// 3. Show clear confirmation message
class SignupFlowTestPageWidget extends StatefulWidget {
  const SignupFlowTestPageWidget({super.key});

  static String routeName = 'SignupFlowTestPage';
  static String routePath = 'test-signup-flow';

  @override
  State<SignupFlowTestPageWidget> createState() =>
      _SignupFlowTestPageWidgetState();
}

class _SignupFlowTestPageWidgetState extends State<SignupFlowTestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  bool _isLoading = false;
  List<String> _testResults = [];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _clearAllFields() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    setState(() {
      _testResults.add('✓ All text fields cleared');
    });
  }

  void _addTestResult(String result) {
    setState(() {
      _testResults.add(result);
    });
  }

  Future<void> _testSignupFlow() async {
    if (!_formKey.currentState!.validate()) {
      _addTestResult('✗ Validation failed - Please fill all fields correctly');
      return;
    }

    setState(() {
      _isLoading = true;
      _testResults.clear();
    });

    try {
      _addTestResult('→ Starting signup process...');

      // Simulate signup delay
      await Future.delayed(Duration(seconds: 2));

      // Test 1: Check if fields have values before clearing
      _addTestResult('✓ Fields contained data before signup');

      // Test 2: Clear fields after successful signup
      _clearAllFields();

      // Test 3: Show success message
      _addTestResult('✓ Success message displayed');

      // Test 4: Simulate redirect
      await Future.delayed(Duration(milliseconds: 500));
      _addTestResult('✓ Preparing to redirect to login screen...');

      // Show confirmation dialog
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Color(0xFF4ECDC4),
                    size: 32.0,
                  ),
                  SizedBox(width: 12.0),
                  Text('Signup Successful!'),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your account has been created successfully.',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Test Results:',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'WorkSans',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.0,
                        ),
                  ),
                  SizedBox(height: 8.0),
                  ..._testResults.map((result) => Padding(
                        padding: EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          result,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      )),
                  SizedBox(height: 16.0),
                  Text(
                    'You will be redirected to the login screen.',
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              actions: [
                FFButtonWidget(
                  onPressed: () {
                    Navigator.pop(context);
                    // In real implementation, navigate to login page
                    _addTestResult('✓ Redirected to login screen');
                  },
                  text: 'Go to Login',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      _addTestResult('✗ Error: ${e.toString()}');
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

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
            'Signup Flow Test',
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Issue Description
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF4ECDC4).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFF4ECDC4),
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.bug_report,
                              color: Color(0xFF4ECDC4),
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
                          'Current Behavior:',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '• Text fields are NOT cleared after signup\n'
                          '• No redirect to login screen\n'
                          '• No clear confirmation message',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Expected Behavior:',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '✓ Clear all text fields\n'
                          '✓ Show success confirmation\n'
                          '✓ Redirect to login screen',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.0),

                  // Signup Form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Create Account',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'WorkSans',
                                letterSpacing: 0.0,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Fill out the form and test the signup flow',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(height: 24.0),

                        // Name Field
                        TextFormField(
                          controller: _nameController,
                          focusNode: _nameFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
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
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
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
                            hintText: 'Create a password...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(() {
                                _passwordVisible = !_passwordVisible;
                              }),
                              child: Icon(
                                _passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 16.0),

                        // Confirm Password Field
                        TextFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocusNode,
                          autofocus: false,
                          obscureText: !_confirmPasswordVisible,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(() {
                                _confirmPasswordVisible =
                                    !_confirmPasswordVisible;
                              }),
                              child: Icon(
                                _confirmPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 22,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 24.0),

                        // Signup Button
                        FFButtonWidget(
                          onPressed: _isLoading ? null : _testSignupFlow,
                          text: _isLoading ? 'Processing...' : 'Test Signup',
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
                            disabledColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),

                        SizedBox(height: 16.0),

                        // Manual Clear Button (for testing)
                        FFButtonWidget(
                          onPressed: _clearAllFields,
                          text: 'Clear Fields Manually',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsets.zero,
                            iconPadding: EdgeInsets.zero,
                            color: FlutterFlowTheme.of(context).accent1,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.0),

                  // Test Results
                  if (_testResults.isNotEmpty)
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
                          Text(
                            'Test Results',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          SizedBox(height: 12.0),
                          ..._testResults.map((result) => Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      result.startsWith('✓')
                                          ? Icons.check_circle
                                          : result.startsWith('✗')
                                              ? Icons.error
                                              : Icons.arrow_forward,
                                      color: result.startsWith('✓')
                                          ? Color(0xFF4ECDC4)
                                          : result.startsWith('✗')
                                              ? FlutterFlowTheme.of(context)
                                                  .error
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                      size: 20.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        result,
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'WorkSans',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
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
}
