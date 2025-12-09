import '/backend/api_requests/api_calls.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/lucille_g_p_t_comp/ai_chat_component/ai_chat_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chat_with_lucille_version5_model.dart';
export 'chat_with_lucille_version5_model.dart';

class ChatWithLucilleVersion5Widget extends StatefulWidget {
  const ChatWithLucilleVersion5Widget({super.key});

  static String routeName = 'ChatWithLucilleVersion5';
  static String routePath = 'chatWithLucilleVersion5';

  @override
  State<ChatWithLucilleVersion5Widget> createState() =>
      _ChatWithLucilleVersion5WidgetState();
}

class _ChatWithLucilleVersion5WidgetState
    extends State<ChatWithLucilleVersion5Widget> with TickerProviderStateMixin {
  late ChatWithLucilleVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWithLucilleVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatWithLucilleVersion5'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/a3b5e0293de73e106d2a7cfcdc1f7d8fdd903b07.gif',
                    ).image,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x31EDF1F7),
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 25.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).accent1,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHAT_WITH_LUCILLE_VERSION5_chevron_left_');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ncdyyqwy' /* Chat with Lucille */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'The Seasons',
                                    fontSize: 26.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 15.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 25.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                Icons.menu,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'CHAT_WITH_LUCILLE_VERSION5_menu_ICN_ON_T');
                                logFirebaseEvent('IconButton_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SideNavWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: FlutterFlowButtonTabBar(
                                  useToggleButtonStyle: true,
                                  isScrollable: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'The Seasons',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    shadows: [
                                      Shadow(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        offset: Offset(8.0, 8.0),
                                        blurRadius: 8.0,
                                      )
                                    ],
                                  ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'The Seasons',
                                            letterSpacing: 0.0,
                                          ),
                                  labelColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                  unselectedBackgroundColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderWidth: 2.0,
                                  borderRadius: 50.0,
                                  elevation: 3.0,
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 11.0, 0.0),
                                  buttonMargin: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  padding: EdgeInsets.all(8.0),
                                  tabs: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Icon(
                                            Icons.mic,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '33uhf3xp' /* Talk with Lucille */,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Icon(
                                            Icons.message_outlined,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'iizapjg3' /* Chat with Lucille */,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  controller: _model.tabBarController,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController,
                                  children: [
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 230),
                                            curve: Curves.easeOut,
                                            width: 149.7,
                                            height: 108.31,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 8.0,
                                                  color: Color(0xC9EDF1F7),
                                                  offset: Offset(
                                                    8.0,
                                                    8.0,
                                                  ),
                                                  spreadRadius: 8.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50.0),
                                            ),
                                            child: InkWell(
                                              splashColor:
                                                  Colors.transparent,
                                              focusColor:
                                                  Colors.transparent,
                                              hoverColor:
                                                  Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                // Prevent duplicate taps
                                                if (FFAppState().isListening) {
                                                  print('[DEBUG] Already processing, please wait...');
                                                  return;
                                                }
                                                
                                                try {
                                                  print('=== [START] Voice Interaction ===');
                                                  
                                                  // Step 1: Request microphone permission
                                                  logFirebaseEvent('LottieAnimation_request_permissions');
                                                  print('[STEP 1] Requesting microphone permission...');
                                                  await requestPermission(microphonePermission);
                                                  print('[STEP 1] Permission granted');
                                                  
                                                  // Step 2: Start listening to user voice
                                                  logFirebaseEvent('LottieAnimation_custom_action');
                                                  print('[STEP 2] Starting voice recognition...');
                                                  print('[STEP 2] Please speak now...');
                                                  
                                                  _model.returnedVoiceText = await actions.startListening();
                                                  
                                                  print('[STEP 2] Voice recognition result: "${_model.returnedVoiceText}"');
                                                  print('[STEP 2] Text length: ${_model.returnedVoiceText?.length ?? 0}');
                                                  
                                                  // Step 3: Validate voice input
                                                  if (_model.returnedVoiceText == null || 
                                                      _model.returnedVoiceText!.trim().isEmpty) {
                                                    print('[ERROR] No valid speech detected');
                                                    throw Exception('No speech detected, please try again');
                                                  }
                                                  
                                                  // Step 4: Update app state
                                                  logFirebaseEvent('LottieAnimation_update_app_state');
                                                  FFAppState().userVoiceMessage = _model.returnedVoiceText!;
                                                  FFAppState().isListening = true;
                                                  safeSetState(() {});
                                                  
                                                  print('[STEP 4] User message saved: ${FFAppState().userVoiceMessage}');
                                                  
                                                  // Step 5: Get chat history
                                                  logFirebaseEvent('LottieAnimation_backend_call');
                                                  print('[STEP 5] Fetching chat history...');
                                                  print('[STEP 5] Session ID: ${FFAppState().chatSessionId}');
                                                  
                                                  _model.getChatHistory = await LucilleSelfCareAILLMGroup
                                                      .getChatHistoryCall.call(
                                                    sessionId: FFAppState().chatSessionId,
                                                  );
                                                  
                                                  print('[STEP 5] Chat history status: ${_model.getChatHistory?.succeeded}');

                                                  // Step 6: Send message to AI
                                                  logFirebaseEvent('LottieAnimation_backend_call');
                                                  print('[STEP 6] Sending message to AI...');
                                                  
                                                  _model.voiceChatLucilleResponse1 = await LucilleChatCall.call(
                                                    sessionId: FFAppState().chatSessionId,
                                                    message: _model.returnedVoiceText,
                                                  );
                                                  
                                                  print('[STEP 6] AI response status: ${_model.voiceChatLucilleResponse1?.succeeded}');
                                                  print('[STEP 6] Response data: ${_model.voiceChatLucilleResponse1?.jsonBody}');

                                                  // Step 7: Process AI response
                                                  if ((_model.getChatHistory?.succeeded ?? false) &&
                                                      (_model.voiceChatLucilleResponse1?.succeeded ?? false)) {
                                                    
                                                    logFirebaseEvent('LottieAnimation_custom_action');
                                                    
                                                    final aiResponse = LucilleChatCall.aIResponse(
                                                      (_model.voiceChatLucilleResponse1?.jsonBody ?? ''),
                                                    );
                                                    
                                                    print('[STEP 7] AI reply content: "$aiResponse"');
                                                    print('[STEP 7] Reply length: ${aiResponse?.length ?? 0}');
                                                    
                                                    if (aiResponse != null && aiResponse.isNotEmpty) {
                                                      print('[STEP 7] Starting text-to-speech...');
                                                      print('[STEP 7] AI response: $aiResponse');
                                                      
                                                      // Speak the response
                                                      await actions.speakText(aiResponse);
                                                      print('[STEP 7] Text-to-speech completed');
                                                    } else {
                                                      print('[WARNING] AI response is empty');
                                                    }
                                                    
                                                  } else {
                                                    // Need to create new session
                                                    print('[WARNING] Chat history failed, creating new session...');
                                                    
                                                    logFirebaseEvent('LottieAnimation_backend_call');
                                                    _model.sessionIDVoiceChat = await LucilleSelfCareAILLMGroup
                                                        .createSessionCall.call();
                                                    
                                                    final newSessionId = LucilleSelfCareAILLMGroup
                                                        .createSessionCall.sessionId(
                                                          (_model.sessionIDVoiceChat?.jsonBody ?? ''),
                                                        ).toString();
                                                    
                                                    print('[NEW SESSION] Session ID: $newSessionId');
                                                    FFAppState().chatSessionId = newSessionId;

                                                    logFirebaseEvent('LottieAnimation_backend_call');
                                                    _model.voiceChatLucilleResponse2 = await LucilleChatCall.call(
                                                      message: _model.returnedVoiceText,
                                                      sessionId: newSessionId,
                                                    );
                                                    
                                                    print('[NEW SESSION] AI response status: ${_model.voiceChatLucilleResponse2?.succeeded}');

                                                    if (_model.voiceChatLucilleResponse2?.succeeded ?? false) {
                                                      logFirebaseEvent('LottieAnimation_custom_action');
                                                      
                                                      final aiResponse = LucilleChatCall.aIResponse(
                                                        (_model.voiceChatLucilleResponse2?.jsonBody ?? ''),
                                                      );
                                                      
                                                      print('[NEW SESSION] AI reply: "$aiResponse"');
                                                      
                                                      if (aiResponse != null && aiResponse.isNotEmpty) {
                                                        print('[NEW SESSION] Starting text-to-speech...');
                                                        print('[NEW SESSION] AI response: $aiResponse');
                                                        
                                                        await actions.speakText(aiResponse);
                                                      }
                                                    }
                                                  }

                                                  // Step 8: Chat history is already managed by the API
                                                  print('[STEP 8] Chat history updated by API');
                                                  
                                                  print('=== [COMPLETE] Voice Interaction ===\n');
                                                  
                                                } catch (e, stackTrace) {
                                                  print('=== [ERROR] Exception Occurred ===');
                                                  print('[ERROR] Message: $e');
                                                  print('[ERROR] Stack trace: $stackTrace');
                                                  
                                                  logFirebaseEvent('LottieAnimation_show_snack_bar');
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Voice error: $e'),
                                                      backgroundColor: Colors.red,
                                                      duration: Duration(seconds: 5),
                                                    ),
                                                  );
                                                } finally {
                                                  print('[CLEANUP] Resetting listening state');
                                                  FFAppState().isListening = false;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: Lottie.asset(
                                                'assets/jsons/Enable_mic.json',
                                                width: 209.6,
                                                height: 219.1,
                                                fit: BoxFit.contain,
                                                reverse: true,
                                                animate: true,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 45.0),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                                            child: Text(
                                              FFLocalizations.of(context).getText(
                                                'o6svwmde' /* Tap the mic to talk directly w... */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                fontFamily: 'WorkSans',
                                                color: FlutterFlowTheme.of(context).alternate,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20.0),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Logo_ESCAPE_Black.png',
                                              width: 237.7,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.1,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model:
                                                  _model.aiChatComponentModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: AiChatComponentWidget(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
