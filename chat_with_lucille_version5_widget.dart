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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
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
                        height: double.infinity,
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
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_WITH_LUCILLE_VERSION5_chevron_left_');
                                      logFirebaseEvent(
                                          'IconButton_navigate_back');
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
                                    fillColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    icon: Icon(
                                      Icons.menu,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'CHAT_WITH_LUCILLE_VERSION5_menu_ICN_ON_T');
                                      logFirebaseEvent(
                                          'IconButton_bottom_sheet');
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
                                                  MediaQuery.viewInsetsOf(
                                                      context),
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
                                        labelStyle:
                                            FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                          fontFamily: 'The Seasons',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          shadows: [
                                            Shadow(
                                              color: FlutterFlowTheme.of(
                                                      context)
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
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        unselectedBackgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderWidth: 2.0,
                                        borderRadius: 50.0,
                                        elevation: 3.0,
                                        labelPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 11.0, 0.0),
                                        buttonMargin:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 8.0, 0.0),
                                        padding: EdgeInsets.all(8.0),
                                        tabs: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.mic,
                                                ),
                                              ),
                                              Tab(
                                                text: FFLocalizations.of(
                                                        context)
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.message_outlined,
                                                ),
                                              ),
                                              Tab(
                                                text: FFLocalizations.of(
                                                        context)
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
                                              children: [
                                                Align(
                                                  alignment: AlignmentDirectional(
                                                      0.0, -1.0),
                                                  child: Padding(
                                                    padding: EdgeInsetsDirectional
                                                        .fromSTEB(0.0, 375.0,
                                                            0.0, 0.0),
                                                    child: AnimatedContainer(
                                                      duration: Duration(
                                                          milliseconds: 230),
                                                      curve: Curves.easeOut,
                                                      width: 149.7,
                                                      height: 108.31,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 8.0,
                                                            color:
                                                                Color(0xC9EDF1F7),
                                                            offset: Offset(
                                                              8.0,
                                                              8.0,
                                                            ),
                                                            spreadRadius: 8.0,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
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
                                                          logFirebaseEvent(
                                                              'CHAT_WITH_LUCILLE_VERSION5_LottieAnimati');
                                                          logFirebaseEvent(
                                                              'LottieAnimation_request_permissions');
                                                          await requestPermission(
                                                              microphonePermission);
                                                          logFirebaseEvent(
                                                              'LottieAnimation_custom_action');
                                                          _model.returnedVoiceText =
                                                              await actions
                                                                  .startListening();
                                                          logFirebaseEvent(
                                                              'LottieAnimation_update_app_state');
                                                          FFAppState()
                                                                  .userVoiceMessage =
                                                              _model
                                                                  .returnedVoiceText!;
                                                          FFAppState()
                                                                  .isListening =
                                                              true;
                                                          safeSetState(() {});
                                                          logFirebaseEvent(
                                                              'LottieAnimation_backend_call');
                                                          _model.getChatHistory =
                                                              await LucilleSelfCareAILLMGroup
                                                                  .getChatHistoryCall
                                                                  .call(
                                                            sessionId: FFAppState()
                                                                .chatSessionId,
                                                          );

                                                          logFirebaseEvent(
                                                              'LottieAnimation_backend_call');
                                                          _model.voiceChatLucilleResponse1 =
                                                              await LucilleChatCall
                                                                  .call(
                                                            sessionId: FFAppState()
                                                                .chatSessionId,
                                                            message: _model
                                                                .returnedVoiceText,
                                                          );

                                                          if ((_model
                                                                      .getChatHistory
                                                                      ?.succeeded ??
                                                                  true)) {
                                                            logFirebaseEvent(
                                                                'LottieAnimation_custom_action');
                                                            await actions
                                                                .speakText(
                                                              LucilleChatCall
                                                                  .aIResponse(
                                                                (_model.voiceChatLucilleResponse1
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'LottieAnimation_backend_call');
                                                            _model.sessionIDVoiceChat =
                                                                await LucilleSelfCareAILLMGroup
                                                                    .createSessionCall
                                                                    .call();

                                                            logFirebaseEvent(
                                                                'LottieAnimation_backend_call');
                                                            _model.voiceChatLucilleResponse2 =
                                                                await LucilleChatCall
                                                                    .call(
                                                              message: _model
                                                                  .returnedVoiceText,
                                                              sessionId:
                                                                  LucilleSelfCareAILLMGroup
                                                                      .createSessionCall
                                                                      .sessionId(
                                                                (_model.sessionIDVoiceChat
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ).toString(),
                                                            );

                                                            if ((_model.voiceChatLucilleResponse2
                                                                        ?.succeeded ??
                                                                    true) ==
                                                                false) {
                                                              logFirebaseEvent(
                                                                  'LottieAnimation_custom_action');
                                                              await actions
                                                                  .speakText(
                                                                LucilleChatCall
                                                                    .aIResponse(
                                                                  (_model.voiceChatLucilleResponse2
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )!,
                                                              );
                                                            }
                                                          }

                                                          logFirebaseEvent(
                                                              'LottieAnimation_update_app_state');
                                                          FFAppState()
                                                              .updateChatHistoryAtIndex(
                                                            (_model.getChatHistory
                                                                    ?.jsonBody ??
                                                                ''),
                                                            (_) => (_model.voiceChatLucilleResponse1
                                                                    ?.jsonBody ??
                                                                ''),
                                                          );
                                                          FFAppState()
                                                                  .isListening =
                                                              !(FFAppState()
                                                                      .isListening ??
                                                                  true);
                                                          FFAppState()
                                                                  .chatSessionId =
                                                              FFAppState()
                                                                  .chatSessionId;
                                                          FFAppState()
                                                              .update(() {});

                                                          safeSetState(() {});
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
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      45.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'o6svwmde' /* Tap the mic to talk directly w... */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 370.2,
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                shadows: [
                                                                  Shadow(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    offset:
                                                                        Offset(
                                                                            8.0,
                                                                            8.0),
                                                                    blurRadius:
                                                                        8.0,
                                                                  )
                                                                ],
                                                              ),
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              0.0,
                                                              0.0,
                                                              0.0,
                                                              20.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/Logo_ESCAPE_Black.png',
                                                      width: 237.7,
                                                      height:
                                                          MediaQuery.sizeOf(
                                                                      context)
                                                                  .height *
                                                              0.1,
                                                      fit: BoxFit.contain,
                                                    ),
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
                                                    model: _model
                                                        .aiChatComponentModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        AiChatComponentWidget(),
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
            );
          },
        ),
      ),
    );
  }
}