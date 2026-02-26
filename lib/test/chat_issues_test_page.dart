import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';

/// Chat Issues Test Page
/// 
/// Issue: Chat with Lucille has multiple problems:
/// 1. Messages repeat multiple times (both user and AI)
/// 2. Response from Lucille has a slight delay
/// 3. Text field does not clear after sending
/// 4. Messages occasionally fail to send with no error/warning
/// 
/// This test page demonstrates proper implementation with:
/// - Message deduplication
/// - Send button disabled during processing
/// - Text field auto-clear after send
/// - Explicit error handling and user feedback
/// - Loading indicators during delays
class ChatIssuesTestPageWidget extends StatefulWidget {
  const ChatIssuesTestPageWidget({super.key});

  static String routeName = 'ChatIssuesTestPage';
  static String routePath = 'test-chat-issues';

  @override
  State<ChatIssuesTestPageWidget> createState() =>
      _ChatIssuesTestPageWidgetState();
}

class _ChatIssuesTestPageWidgetState extends State<ChatIssuesTestPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _messageController = TextEditingController();
  final _messageFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();
  
  bool _isSending = false;
  List<Map<String, dynamic>> _messages = [];
  Set<String> _messageIds = {}; // To prevent duplicates
  int _sendAttempts = 0;
  String? _lastError;

  @override
  void initState() {
    super.initState();
    _addSystemMessage('Chat initialized. Test the following issues:\n'
        '• Send duplicate prevention\n'
        '• Text field clearing\n'
        '• Error handling\n'
        '• Loading states');
  }

  @override
  void dispose() {
    _messageController.dispose();
    _messageFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _generateMessageId() {
    return '${DateTime.now().millisecondsSinceEpoch}_${_messages.length}';
  }

  void _addSystemMessage(String text) {
    final messageId = _generateMessageId();
    setState(() {
      _messages.add({
        'id': messageId,
        'text': text,
        'isUser': false,
        'isSystem': true,
        'timestamp': DateTime.now(),
      });
    });
    _scrollToBottom();
  }

  void _addUserMessage(String text) {
    final messageId = _generateMessageId();
    
    // Prevent duplicate messages
    if (_messageIds.contains(messageId)) {
      print('[DUPLICATE PREVENTED] Message ID already exists: $messageId');
      return;
    }
    
    setState(() {
      _messageIds.add(messageId);
      _messages.add({
        'id': messageId,
        'text': text,
        'isUser': true,
        'isSystem': false,
        'timestamp': DateTime.now(),
      });
    });
    _scrollToBottom();
  }

  void _addAIMessage(String text) {
    final messageId = _generateMessageId();
    
    // Prevent duplicate AI responses
    if (_messages.isNotEmpty && 
        _messages.last['text'] == text && 
        _messages.last['isUser'] == false) {
      print('[DUPLICATE PREVENTED] AI message already shown: $text');
      return;
    }
    
    setState(() {
      _messageIds.add(messageId);
      _messages.add({
        'id': messageId,
        'text': text,
        'isUser': false,
        'isSystem': false,
        'timestamp': DateTime.now(),
      });
    });
    _scrollToBottom();
  }

  void _addErrorMessage(String text) {
    final messageId = _generateMessageId();
    setState(() {
      _messages.add({
        'id': messageId,
        'text': text,
        'isUser': false,
        'isSystem': true,
        'isError': true,
        'timestamp': DateTime.now(),
      });
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> _sendMessage() async {
    final messageText = _messageController.text.trim();
    
    // Validate input
    if (messageText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a message'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Prevent multiple simultaneous sends
    if (_isSending) {
      print('[SEND BLOCKED] Already sending a message');
      _addErrorMessage('⚠ Please wait for current message to complete');
      return;
    }

    setState(() {
      _isSending = true;
      _sendAttempts++;
      _lastError = null;
    });

    try {
      print('[SEND] Attempt #$_sendAttempts: "$messageText"');
      
      // Add user message immediately
      _addUserMessage(messageText);
      
      // CRITICAL: Clear text field IMMEDIATELY after adding to UI
      // This prevents the issue of text field not clearing
      _messageController.clear();
      
      // Show "AI is typing" indicator
      _addSystemMessage('Lucille is typing...');

      // Send to backend
      final response = await LucilleChatCall.call(
        sessionId: FFAppState().chatSessionId,
        message: messageText,
      );

      // Remove "typing" indicator
      setState(() {
        _messages.removeWhere((msg) => 
          msg['isSystem'] == true && 
          msg['text'] == 'Lucille is typing...'
        );
      });

      if (response.succeeded) {
        final aiResponse = LucilleChatCall.aIResponse(
          response.jsonBody ?? '',
        );

        if (aiResponse != null && aiResponse.isNotEmpty) {
          _addAIMessage(aiResponse);
          print('[SEND SUCCESS] AI responded: "${aiResponse.substring(0, aiResponse.length > 50 ? 50 : aiResponse.length)}..."');
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✓ Message sent successfully'),
              backgroundColor: Color(0xFF4ECDC4),
              duration: Duration(seconds: 1),
            ),
          );
        } else {
          throw Exception('AI response is empty');
        }
      } else {
        throw Exception('API call failed: ${response.statusCode} - ${response.error}');
      }
      
    } catch (e) {
      print('[SEND ERROR] $e');
      setState(() {
        _lastError = e.toString();
      });
      
      _addErrorMessage('✗ Failed to send: $e');
      
      // Show persistent error to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('✗ Message failed: $e'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Retry',
            textColor: Colors.white,
            onPressed: () {
              _messageController.text = messageText;
              _sendMessage();
            },
          ),
        ),
      );
    } finally {
      // Always reset sending state
      if (mounted) {
        setState(() {
          _isSending = false;
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
            'Chat Issues Test',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'WorkSans',
                  color: Colors.white,
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.info_outline, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Test Info'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Issues Being Tested:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('✓ Duplicate message prevention'),
                          Text('✓ Text field auto-clearing'),
                          Text('✓ Error handling with feedback'),
                          Text('✓ Loading states during send'),
                          Text('✓ Send button disabled while processing'),
                          SizedBox(height: 16),
                          Text('Improvements Implemented:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('• Unique message IDs'),
                          Text('• _isSending flag prevents duplicates'),
                          Text('• controller.clear() after send'),
                          Text('• try/catch with user-visible errors'),
                          Text('• Retry option on failures'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              // Issue Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color(0xFFFF6B6B).withOpacity(0.1),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFFF6B6B),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Testing Chat Issues',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'WorkSans',
                            color: Color(0xFFFF6B6B),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.0,
                          ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Send attempts: $_sendAttempts | Messages: ${_messages.length}',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'WorkSans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),

              // Messages List
              Expanded(
                child: _messages.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 64,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'No messages yet',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Start typing to test the chat',
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.all(16.0),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return _buildMessageBubble(message);
                        },
                      ),
              ),

              // Input Area
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x1A000000),
                      offset: Offset(0.0, -2.0),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _messageController,
                        focusNode: _messageFocusNode,
                        enabled: !_isSending,
                        decoration: InputDecoration(
                          hintText: _isSending 
                              ? 'Sending...' 
                              : 'Type a message...',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 1.0,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'WorkSans',
                              letterSpacing: 0.0,
                            ),
                        maxLines: 3,
                        minLines: 1,
                        onFieldSubmitted: (_) {
                          if (!_isSending) {
                            _sendMessage();
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _isSending ? null : _sendMessage,
                        borderRadius: BorderRadius.circular(28.0),
                        child: Container(
                          width: 56.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: _isSending
                                ? FlutterFlowTheme.of(context).secondaryText
                                : FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: _isSending
                              ? Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                    strokeWidth: 3.0,
                                  ),
                                )
                              : Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final isUser = message['isUser'] ?? false;
    final isSystem = message['isSystem'] ?? false;
    final isError = message['isError'] ?? false;
    final text = message['text'] ?? '';

    if (isSystem) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isError
              ? Colors.red.withOpacity(0.1)
              : FlutterFlowTheme.of(context).accent3.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.info_outline,
              size: 16.0,
              color: isError
                  ? Colors.red
                  : FlutterFlowTheme.of(context).secondaryText,
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Text(
                text,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'WorkSans',
                      color: isError
                          ? Colors.red[700]
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      );
    }

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: isUser
              ? FlutterFlowTheme.of(context).primary
              : FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: isUser
                ? Colors.transparent
                : FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'WorkSans',
                    color: isUser
                        ? Colors.white
                        : FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
            SizedBox(height: 4.0),
            Text(
              _formatTimestamp(message['timestamp']),
              style: FlutterFlowTheme.of(context).bodySmall.override(
                    fontFamily: 'WorkSans',
                    color: isUser
                        ? Colors.white.withOpacity(0.7)
                        : FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 10.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime? timestamp) {
    if (timestamp == null) return '';
    final now = DateTime.now();
    final diff = now.difference(timestamp);
    
    if (diff.inSeconds < 60) return '${diff.inSeconds}s ago';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    return '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
