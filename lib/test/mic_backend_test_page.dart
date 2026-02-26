import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/permissions_util.dart';

/// Microphone Backend Integration Test Page
/// 
/// Issue: Microphone works fine, but backend integration is incomplete
/// 
/// Test Cases:
/// 1. Microphone permission and recording
/// 2. Voice-to-text transcription
/// 3. Backend API call with transcribed text
/// 4. Error handling and user feedback
/// 5. Loading states during processing
class MicBackendTestPageWidget extends StatefulWidget {
  const MicBackendTestPageWidget({super.key});

  static String routeName = 'MicBackendTestPage';
  static String routePath = 'test-mic-backend';

  @override
  State<MicBackendTestPageWidget> createState() =>
      _MicBackendTestPageWidgetState();
}

class _MicBackendTestPageWidgetState extends State<MicBackendTestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isListening = false;
  bool _isProcessing = false;
  bool _isSendingToBackend = false;
  String? _transcribedText;
  String? _backendResponse;
  String? _errorMessage;
  List<Map<String, dynamic>> _testSteps = [];

  @override
  void dispose() {
    super.dispose();
  }

  void _addTestStep(String step, String status, String details) {
    setState(() {
      _testSteps.add({
        'step': step,
        'status': status, // 'success', 'error', 'processing'
        'details': details,
        'timestamp': DateTime.now(),
      });
    });
  }

  void _clearTestSteps() {
    setState(() {
      _testSteps.clear();
      _transcribedText = null;
      _backendResponse = null;
      _errorMessage = null;
    });
  }

  Future<void> _testMicrophoneBackendIntegration() async {
    _clearTestSteps();
    setState(() {
      _isListening = true;
      _errorMessage = null;
    });

    try {
      // Step 1: Request microphone permission
      _addTestStep('Permission', 'processing', 'Requesting microphone access...');
      
      await requestPermission(microphonePermission);
      
      _addTestStep('Permission', 'success', 'Microphone permission granted');

      // Step 2: Start voice recording and transcription
      _addTestStep('Recording', 'processing', 'Listening for voice input...');
      setState(() {
        _isProcessing = true;
      });

      final transcribedText = await actions.startListening();

      if (transcribedText == null || transcribedText.trim().isEmpty) {
        throw Exception('No speech detected. Please try again.');
      }

      setState(() {
        _transcribedText = transcribedText;
      });

      _addTestStep(
        'Recording',
        'success',
        'Voice transcribed: "${transcribedText.substring(0, transcribedText.length > 50 ? 50 : transcribedText.length)}${transcribedText.length > 50 ? '...' : ''}"',
      );

      // Step 3: Send to backend API
      _addTestStep('Backend', 'processing', 'Sending transcribed text to backend...');
      setState(() {
        _isSendingToBackend = true;
      });

      // Example: Send to Lucille Chat API (adjust to your actual backend endpoint)
      final backendResponse = await LucilleChatCall.call(
        sessionId: FFAppState().chatSessionId,
        message: transcribedText,
      );

      if (backendResponse.succeeded) {
        final aiResponse = LucilleChatCall.aIResponse(
          backendResponse.jsonBody ?? '',
        );

        setState(() {
          _backendResponse = aiResponse?.toString() ?? 'No response content';
        });

        _addTestStep(
          'Backend',
          'success',
          'Backend responded: "${_backendResponse!.substring(0, _backendResponse!.length > 50 ? 50 : _backendResponse!.length)}${_backendResponse!.length > 50 ? '...' : ''}"',
        );

        // Step 4: Test text-to-speech (optional)
        if (aiResponse != null && aiResponse.isNotEmpty) {
          _addTestStep('TTS', 'processing', 'Speaking response...');
          await actions.speakText(aiResponse);
          _addTestStep('TTS', 'success', 'Response spoken successfully');
        }

        _addTestStep('Complete', 'success', 'All tests passed! Backend integration working.');
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✓ Backend integration test passed!'),
              backgroundColor: Color(0xFF4ECDC4),
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        throw Exception('Backend API call failed: ${backendResponse.statusCode}');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });

      _addTestStep('Error', 'error', e.toString());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✗ Test failed: $e'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 5),
          ),
        );
      }
    } finally {
      setState(() {
        _isListening = false;
        _isProcessing = false;
        _isSendingToBackend = false;
      });
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
            'Mic Backend Integration Test',
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
                      color: Color(0xFFFF6B6B).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFFFF6B6B),
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
                              color: Color(0xFFFF6B6B),
                              size: 24.0,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              'Issue Description',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Color(0xFFFF6B6B),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'The microphone on mic_test_page.dart is working fine, but the backend integration appears incomplete. It needs proper connection to function fully.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          'Test Actions:',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'WorkSans',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Text(
                          '• Click "Start Voice Test" button\n'
                          '• Grant microphone permission\n'
                          '• Speak clearly when prompted\n'
                          '• Verify transcription accuracy\n'
                          '• Check backend API call succeeds\n'
                          '• Confirm proper error handling',
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

                  // Test Control Button
                  FFButtonWidget(
                    onPressed: (_isListening || _isProcessing || _isSendingToBackend)
                        ? null
                        : _testMicrophoneBackendIntegration,
                    text: _isListening
                        ? 'Listening...'
                        : _isProcessing
                            ? 'Processing...'
                            : _isSendingToBackend
                                ? 'Sending to Backend...'
                                : 'Start Voice Test',
                    icon: Icon(
                      _isListening
                          ? Icons.mic
                          : _isProcessing
                              ? Icons.hourglass_empty
                              : _isSendingToBackend
                                  ? Icons.cloud_upload
                                  : Icons.play_arrow,
                      size: 24.0,
                    ),
                    options: FFButtonOptions(
                      height: 56.0,
                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      color: (_isListening || _isProcessing || _isSendingToBackend)
                          ? FlutterFlowTheme.of(context).secondaryText
                          : FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Clear Results Button
                  if (_testSteps.isNotEmpty)
                    FFButtonWidget(
                      onPressed: _clearTestSteps,
                      text: 'Clear Results',
                      icon: Icon(
                        Icons.clear_all,
                        size: 20.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'WorkSans',
                              letterSpacing: 0.0,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),

                  SizedBox(height: 24.0),

                  // Test Results
                  if (_testSteps.isNotEmpty) ...[
                    Text(
                      'Test Results',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'WorkSans',
                            letterSpacing: 0.0,
                          ),
                    ),
                    SizedBox(height: 16.0),
                    ..._testSteps.map((step) => _buildTestStepCard(
                          step: step['step'],
                          status: step['status'],
                          details: step['details'],
                        )),
                  ],

                  SizedBox(height: 24.0),

                  // Transcribed Text Display
                  if (_transcribedText != null) ...[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                Icons.text_fields,
                                color: Color(0xFF4ECDC4),
                                size: 24.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Transcribed Text',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xFF4ECDC4),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            _transcribedText!,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],

                  // Backend Response Display
                  if (_backendResponse != null) ...[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                Icons.cloud_done,
                                color: Color(0xFFFFE66D),
                                size: 24.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Backend Response',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xFFFFE66D),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            _backendResponse!,
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                  ],

                  // Error Display
                  if (_errorMessage != null) ...[
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 24.0,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'Error Occurred',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Colors.red,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            _errorMessage!,
                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.red[700],
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTestStepCard({
    required String step,
    required String status,
    required String details,
  }) {
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case 'success':
        statusColor = Color(0xFF4ECDC4);
        statusIcon = Icons.check_circle;
        break;
      case 'error':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      case 'processing':
        statusColor = Color(0xFFFFE66D);
        statusIcon = Icons.hourglass_empty;
        break;
      default:
        statusColor = FlutterFlowTheme.of(context).secondaryText;
        statusIcon = Icons.info;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            statusIcon,
            color: statusColor,
            size: 24.0,
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'WorkSans',
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.0,
                      ),
                ),
                SizedBox(height: 4.0),
                Text(
                  details,
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'WorkSans',
                        letterSpacing: 0.0,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
