import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/lucille_g_p_t_comp/ai_chat_component/ai_chat_component_widget.dart';
import 'dart:convert';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chat_lucille_comp_model.dart';
export 'chat_lucille_comp_model.dart';

/// New Component Gen
class ChatLucilleCompWidget extends StatefulWidget {
  const ChatLucilleCompWidget({super.key});

  @override
  State<ChatLucilleCompWidget> createState() => _ChatLucilleCompWidgetState();
}

class _ChatLucilleCompWidgetState extends State<ChatLucilleCompWidget>
    with TickerProviderStateMixin {
  late ChatLucilleCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatLucilleCompModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Archetype.png',
          ).image,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 880.88,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0x31EDF1F7), FlutterFlowTheme.of(context).secondary],
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
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 0.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 25.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).alternate,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).accent1,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'q64iqqfy' /* Chat with Lucille */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'The Seasons',
                          fontSize: 26.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 15.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 25.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondary,
                    icon: Icon(
                      Icons.volume_up,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ),
              ].divide(SizedBox(width: 16.0)),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: true,
                        isScrollable: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'The Seasons',
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          shadows: [
                            Shadow(
                              color: FlutterFlowTheme.of(context).primary,
                              offset: Offset(8.0, 8.0),
                              blurRadius: 8.0,
                            )
                          ],
                        ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'The Seasons',
                                  letterSpacing: 0.0,
                                ),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).primary,
                        borderWidth: 2.0,
                        borderRadius: 50.0,
                        elevation: 3.0,
                        labelPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 11.0, 0.0),
                        buttonMargin:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        padding: EdgeInsets.all(8.0),
                        tabs: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.mic,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'ych00dpp' /* Talk with Lucille */,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Icon(
                                  Icons.message_outlined,
                                ),
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'lzzsfs6u' /* Chat with Lucille */,
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
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 375.0, 0.0, 0.0),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 230),
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
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CHAT_LUCILLE_LottieAnimation_si01guub_ON');
                                          logFirebaseEvent(
                                              'LottieAnimation_request_permissions');
                                          await requestPermission(
                                              microphonePermission);
                                          logFirebaseEvent(
                                              'LottieAnimation_custom_action');
                                          _model.returnedVoiceText =
                                              await actions.startListening();
                                          logFirebaseEvent(
                                              'LottieAnimation_update_app_state');
                                          FFAppState().userVoiceMessage =
                                              _model.returnedVoiceText!;
                                          FFAppState().isListening = true;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'LottieAnimation_update_component_state');
                                          _model.isListening = true;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'LottieAnimation_backend_call');
                                          _model.voiceChatLucilleResponse1 =
                                              await LucilleChatStreamCall.call(
                                            sessionId:
                                                FFAppState().chatSessionId,
                                            message: _model.returnedVoiceText,
                                          );

                                          if ((_model.voiceChatLucilleResponse2
                                                  ?.succeeded ??
                                              true)) {
                                            logFirebaseEvent(
                                                'LottieAnimation_custom_action');
                                            await actions.speakText(
                                              LucilleChatStruct.maybeFromMap(
                                                      (_model.voiceChatLucilleResponse1
                                                              ?.jsonBody ??
                                                          ''))!
                                                  .content,
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'LottieAnimation_backend_call');
                                            _model.sessionIDVoiceChat2 =
                                                await LucilleStreamingGroup
                                                    .lucilleStreamingResponseCall
                                                    .call(
                                              sessionID: (_model
                                                          .sessionIDVoiceChat2
                                                          ?.jsonBody ??
                                                      '')
                                                  .toString(),
                                              message: _model.returnedVoiceText,
                                            );
                                            if (_model.sessionIDVoiceChat2
                                                    ?.succeeded ??
                                                true) {
                                              final streamSubscription = _model
                                                  .sessionIDVoiceChat2
                                                  ?.streamedResponse
                                                  ?.stream
                                                  .transform(utf8.decoder)
                                                  .transform(
                                                      const LineSplitter())
                                                  .transform(
                                                      ServerSentEventLineTransformer())
                                                  .map((m) =>
                                                      ResponseStreamMessage(
                                                          message: m))
                                                  .listen(
                                                    (onMessageInput) async {},
                                                    onError:
                                                        (onErrorInput) async {},
                                                    onDone: () async {},
                                                  );
                                            }

                                            logFirebaseEvent(
                                                'LottieAnimation_backend_call');
                                            _model.voiceChatLucilleResponse2 =
                                                await LucilleStreamingGroup
                                                    .lucilleHealthCheckCall
                                                    .call(
                                              sessionID: (_model
                                                          .sessionIDVoiceChat2
                                                          ?.jsonBody ??
                                                      '')
                                                  .toString(),
                                              message: _model.returnedVoiceText,
                                            );

                                            if ((_model.voiceChatLucilleResponse2
                                                        ?.succeeded ??
                                                    true) ==
                                                false) {
                                              logFirebaseEvent(
                                                  'LottieAnimation_custom_action');
                                              await actions.speakText(
                                                LucilleChatStruct.maybeFromMap(
                                                        (_model.voiceChatLucilleResponse2
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .content,
                                              );
                                            }
                                          }

                                          logFirebaseEvent(
                                              'LottieAnimation_update_app_state');
                                          FFAppState().updateChatHistoryAtIndex(
                                            (_model.voiceChatLucilleResponse1
                                                    ?.jsonBody ??
                                                ''),
                                            (_) => (_model
                                                    .voiceChatLucilleResponse1
                                                    ?.jsonBody ??
                                                ''),
                                          );
                                          FFAppState().isListening =
                                              !(FFAppState().isListening ??
                                                  true);
                                          FFAppState().update(() {});

                                          safeSetState(() {});
                                        },
                                        child: Lottie.asset(
                                          'assets/jsons/Enable_mic.json',
                                          width: 209.6,
                                          height: 219.11,
                                          fit: BoxFit.contain,
                                          reverse: true,
                                          animate: FFAppState().isListening
                                              ? true
                                              : false,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'lgpqf9bw' /* Speak */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 162.9,
                                            height: 48.61,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                              fontFamily: 'WorkSans',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              shadows: [
                                                Shadow(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  offset: Offset(2.0, 2.0),
                                                  blurRadius: 8.0,
                                                )
                                              ],
                                            ),
                                            elevation: 8.0,
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 80.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'r7haatmz' /* Tap the mic to talk directly w... */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 370.18,
                                        height: 45.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          shadows: [
                                            Shadow(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              offset: Offset(8.0, 8.0),
                                              blurRadius: 8.0,
                                            )
                                          ],
                                        ),
                                        elevation: 8.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
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
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.aiChatComponentModel,
                                      updateCallback: () => safeSetState(() {}),
                                      updateOnChange: true,
                                      child: AiChatComponentWidget(),
                                    ),
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
    );
  }
}
