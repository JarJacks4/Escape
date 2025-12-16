import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/auth/firebase_auth/auth_util.dart';

/// Email Validation Test Page
/// 
/// Issue: Signup succeeds even with unverified or duplicate emails
/// 
/// Expected Behavior:
/// 1. Validate email format before submission
/// 2. Check if email already exists in the system
/// 3. Prevent signup with invalid/duplicate emails
/// 4. Show clear error messages
class EmailValidationTestPageWidget extends StatefulWidget {
  const EmailValidationTestPageWidget({super.key});

  static String routeName = 'EmailValidationTestPage';
  static String routePath = 'test-email-validation';

  @override
  State<EmailValidationTestPageWidget> createState() =>
      _EmailValidationTestPageWidgetState();
}

class _EmailValidationTestPageWidgetState
    extends State<EmailValidationTestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _passwordVisible = false;
  bool _isLoading = false;
  List<Map<String, dynamic>> _validationResults = [];

  // Simulated existing emails database
  final List<String> _existingEmails = [
    'test@example.com',
    'user@test.com',
    'admin@example.com',
    'demo@test.com',
  ];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool _isValidEmailFormat(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _emailExists(String email) {
    return _existingEmails.contains(email.toLowerCase());
  }

  void _addValidationResult(String test, bool passed, String message) {
    setState(() {
      _validationResults.add({
        'test': test,
        'passed': passed,
        'message': message,
      });
    });
  }

  Future<void> _runEmailValidationTests() async {
    setState(() {
      _isLoading = true;
      _validationResults.clear();
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Test 1: Email Format Validation
    await Future.delayed(Duration(milliseconds: 300));
    if (email.isEmpty) {
      _addValidationResult(
        'Email Required',
        false,
        'Email field cannot be empty',
      );
    } else if (!_isValidEmailFormat(email)) {
      _addValidationResult(
        'Email Format',
        false,
        'Invalid email format: $email',
      );
    } else {
      _addValidationResult(
        'Email Format',
        true,
        'Email format is valid',
      );
    }

    // Test 2: Email Existence Check
    await Future.delayed(Duration(milliseconds: 300));
    if (email.isNotEmpty && _isValidEmailFormat(email)) {
      if (_emailExists(email)) {
        _addValidationResult(
          'Email Duplicate Check',
          false,
          'Email already exists in the system',
        );
      } else {
        _addValidationResult(
          'Email Duplicate Check',
          true,
          'Email is available',
        );
      }
    }

    // Test 3: Password Validation
    await Future.delayed(Duration(milliseconds: 300));
    if (password.isEmpty) {
      _addValidationResult(
        'Password Required',
        false,
        'Password field cannot be empty',
      );
    } else if (password.length < 6) {
      _addValidationResult(
        'Password Length',
        false,
        'Password must be at least 6 characters',
      );
    } else {
      _addValidationResult(
        'Password Validation',
        true,
        'Password meets requirements',
      );
    }

    // Test 4: Overall Signup Eligibility
    await Future.delayed(Duration(milliseconds: 300));
    final allTestsPassed = _validationResults.every((r) => r['passed'] == true);
    
    if (allTestsPassed) {
      _addValidationResult(
        'Signup Eligibility',
        true,
        'All validations passed - Signup can proceed',
      );
      
      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '✓ All validations passed! Signup would be allowed.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 3000),
            backgroundColor: Color(0xFF4ECDC4),
          ),
        );
      }
    } else {
      _addValidationResult(
        'Signup Eligibility',
        false,
        'Signup blocked due to validation failures',
      );
      
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '✗ Validation failed! Signup is blocked.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            duration: Duration(milliseconds: 3000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });
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
            'Email Validation Test',
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
                      color: Color(0xFFFFE66D).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFFFFE66D),
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
                              color: Color(0xFFD4A017),
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
                          '• Signup succeeds with unverified emails\n'
                          '• Duplicate emails are not prevented\n'
                          '• Invalid email formats are accepted\n'
                          '• No proper validation feedback',
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
                          '✓ Validate email format\n'
                          '✓ Check for duplicate emails\n'
                          '✓ Block signup with invalid emails\n'
                          '✓ Show clear error messages',
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

                  // Test Data Info
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
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
                              size: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Test Data',
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Existing emails (will fail duplicate check):',
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        ..._existingEmails.map((email) => Padding(
                              padding: EdgeInsets.only(left: 16.0, top: 4.0),
                              child: Text(
                                '• $email',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Courier',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            )),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.0),

                  // Validation Form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Email Validation Test',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'WorkSans',
                                letterSpacing: 0.0,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Try different email scenarios to test validation',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(height: 24.0),

                        // Email Field
                        TextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            hintText: 'Try: invalid-email or test@example.com',
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
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: FlutterFlowTheme.of(context).primary,
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
                            hintText: 'Enter password (min 6 chars)...',
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
                        ),

                        SizedBox(height: 24.0),

                        // Validate Button
                        FFButtonWidget(
                          onPressed:
                              _isLoading ? null : _runEmailValidationTests,
                          text: _isLoading
                              ? 'Running Tests...'
                              : 'Run Validation Tests',
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

                        // Quick Test Buttons
                        Text(
                          'Quick Test Scenarios:',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(height: 8.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            _buildQuickTestButton(
                              'Invalid Format',
                              'invalid-email',
                              'pass123',
                            ),
                            _buildQuickTestButton(
                              'Duplicate Email',
                              'test@example.com',
                              'pass123',
                            ),
                            _buildQuickTestButton(
                              'Short Password',
                              'new@email.com',
                              '12345',
                            ),
                            _buildQuickTestButton(
                              'Valid Data',
                              'newuser@email.com',
                              'password123',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 24.0),

                  // Validation Results
                  if (_validationResults.isNotEmpty)
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Validation Results',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  color: _validationResults
                                          .every((r) => r['passed'] == true)
                                      ? Color(0xFF4ECDC4).withOpacity(0.2)
                                      : FlutterFlowTheme.of(context)
                                          .error
                                          .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  _validationResults
                                          .every((r) => r['passed'] == true)
                                      ? 'PASSED'
                                      : 'FAILED',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'WorkSans',
                                        color: _validationResults.every(
                                                (r) => r['passed'] == true)
                                            ? Color(0xFF4ECDC4)
                                            : FlutterFlowTheme.of(context).error,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          ..._validationResults.map((result) => Padding(
                                padding: EdgeInsets.only(bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: result['passed']
                                        ? Color(0xFF4ECDC4).withOpacity(0.1)
                                        : FlutterFlowTheme.of(context)
                                            .error
                                            .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: result['passed']
                                          ? Color(0xFF4ECDC4)
                                          : FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        result['passed']
                                            ? Icons.check_circle
                                            : Icons.cancel,
                                        color: result['passed']
                                            ? Color(0xFF4ECDC4)
                                            : FlutterFlowTheme.of(context).error,
                                        size: 24.0,
                                      ),
                                      SizedBox(width: 12.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              result['test'],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'WorkSans',
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            SizedBox(height: 4.0),
                                            Text(
                                              result['message'],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
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

  Widget _buildQuickTestButton(String label, String email, String password) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _emailController.text = email;
          _passwordController.text = password;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        foregroundColor: FlutterFlowTheme.of(context).primaryText,
        elevation: 0,
        side: BorderSide(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      ),
      child: Text(
        label,
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'WorkSans',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
