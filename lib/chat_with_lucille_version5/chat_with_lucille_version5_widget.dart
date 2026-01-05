import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chats_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

  final animationsMap = <String, AnimationInfo>{};

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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'richTextOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 220.0.ms,
            duration: 1570.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          child: Scrollbar(
            controller: _model.columnController,
            child: SingleChildScrollView(
              controller: _model.columnController,
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
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 880.9,
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
                                              padding: MediaQuery.viewInsetsOf(
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
                            Flexible(
                              flex: 1,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.mic,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
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
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  Icons.message_outlined,
                                                ),
                                              ),
                                              Tab(
                                                text:
                                                    FFLocalizations.of(context)
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0.0,
                                                                375.0,
                                                                0.0,
                                                                0.0),
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
                                                            color: Color(
                                                                0xC9EDF1F7),
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
                                                          _model.getChatHistory2 =
                                                              await LucilleStreamingGroup
                                                                  .lucilleStreamingResponseCall
                                                                  .call(
                                                            sessionID: FFAppState()
                                                                .chatSessionId,
                                                          );
                                                          if (_model
                                                                  .getChatHistory2
                                                                  ?.succeeded ??
                                                              true) {
                                                            final streamSubscription = _model
                                                                .getChatHistory2
                                                                ?.streamedResponse
                                                                ?.stream
                                                                .transform(utf8
                                                                    .decoder)
                                                                .transform(
                                                                    const LineSplitter())
                                                                .transform(
                                                                    ServerSentEventLineTransformer())
                                                                .map((m) =>
                                                                    ResponseStreamMessage(
                                                                        message:
                                                                            m))
                                                                .listen(
                                                                  (onMessageInput) async {},
                                                                  onError:
                                                                      (onErrorInput) async {},
                                                                  onDone:
                                                                      () async {},
                                                                );
                                                          }

                                                          logFirebaseEvent(
                                                              'LottieAnimation_backend_call');
                                                          _model.voiceChatLucilleResponse1 =
                                                              await LucilleChatStreamCall
                                                                  .call(
                                                            sessionId: FFAppState()
                                                                .chatSessionId,
                                                            message: _model
                                                                .returnedVoiceText,
                                                          );
                                                          if (_model
                                                                  .voiceChatLucilleResponse1
                                                                  ?.succeeded ??
                                                              true) {
                                                            final streamSubscription = _model
                                                                .voiceChatLucilleResponse1
                                                                ?.streamedResponse
                                                                ?.stream
                                                                .transform(utf8
                                                                    .decoder)
                                                                .transform(
                                                                    const LineSplitter())
                                                                .transform(
                                                                    ServerSentEventLineTransformer())
                                                                .map((m) =>
                                                                    ResponseStreamMessage(
                                                                        message:
                                                                            m))
                                                                .listen(
                                                                  (onMessageInput) async {},
                                                                  onError:
                                                                      (onErrorInput) async {},
                                                                  onDone:
                                                                      () async {},
                                                                );
                                                          }

                                                          if ((_model
                                                                  .getChatHistory2
                                                                  ?.succeeded ??
                                                              true)) {
                                                            logFirebaseEvent(
                                                                'LottieAnimation_custom_action');
                                                            await actions
                                                                .speakText(
                                                              LucilleChatStreamCall
                                                                  .deltaContent(
                                                                (_model.voiceChatLucilleResponse1
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )!,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'LottieAnimation_backend_call');
                                                            _model.sessionIDVoiceChat =
                                                                await LucilleStreamingGroup
                                                                    .lucilleStreamingResponseCall
                                                                    .call(
                                                              sessionID:
                                                                  FFAppState()
                                                                      .chatSessionId,
                                                              message: _model
                                                                  .returnedVoiceText,
                                                            );
                                                            if (_model
                                                                    .sessionIDVoiceChat
                                                                    ?.succeeded ??
                                                                true) {
                                                              final streamSubscription = _model
                                                                  .sessionIDVoiceChat
                                                                  ?.streamedResponse
                                                                  ?.stream
                                                                  .transform(utf8
                                                                      .decoder)
                                                                  .transform(
                                                                      const LineSplitter())
                                                                  .transform(
                                                                      ServerSentEventLineTransformer())
                                                                  .map((m) =>
                                                                      ResponseStreamMessage(
                                                                          message:
                                                                              m))
                                                                  .listen(
                                                                    (onMessageInput) async {},
                                                                    onError:
                                                                        (onErrorInput) async {},
                                                                    onDone:
                                                                        () async {},
                                                                  );
                                                            }

                                                            logFirebaseEvent(
                                                                'LottieAnimation_backend_call');
                                                            _model.voiceChatLucilleResponse2 =
                                                                await LucilleChatStreamCall
                                                                    .call(
                                                              message: _model
                                                                  .returnedVoiceText,
                                                              sessionId:
                                                                  FFAppState()
                                                                      .chatSessionId,
                                                            );
                                                            if (_model
                                                                    .voiceChatLucilleResponse2
                                                                    ?.succeeded ??
                                                                true) {
                                                              final streamSubscription = _model
                                                                  .voiceChatLucilleResponse2
                                                                  ?.streamedResponse
                                                                  ?.stream
                                                                  .transform(utf8
                                                                      .decoder)
                                                                  .transform(
                                                                      const LineSplitter())
                                                                  .transform(
                                                                      ServerSentEventLineTransformer())
                                                                  .map((m) =>
                                                                      ResponseStreamMessage(
                                                                          message:
                                                                              m))
                                                                  .listen(
                                                                    (onMessageInput) async {},
                                                                    onError:
                                                                        (onErrorInput) async {},
                                                                    onDone:
                                                                        () async {},
                                                                  );
                                                            }

                                                            if ((_model.voiceChatLucilleResponse2
                                                                        ?.succeeded ??
                                                                    true) ==
                                                                false) {
                                                              logFirebaseEvent(
                                                                  'LottieAnimation_custom_action');
                                                              await actions
                                                                  .speakText(
                                                                LucilleChatStreamCall
                                                                    .deltaContent(
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
                                                            (_model.getChatHistory2
                                                                    ?.jsonBody ??
                                                                ''),
                                                            (_) => (_model
                                                                    .voiceChatLucilleResponse1
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
                                                          child: FFButtonWidget(
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
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Logo_ESCAPE_Black.png',
                                                    width: 237.7,
                                                    height: MediaQuery.sizeOf(
                                                                context)
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
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 770.0,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Flexible(
                                                            flex: 1,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          24.0,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                    ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          12.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        child:
                                                                            BackdropFilter(
                                                                          filter:
                                                                              ImageFilter.blur(
                                                                            sigmaX:
                                                                                5.0,
                                                                            sigmaY:
                                                                                4.0,
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  flex: 1,
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, -1.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final chat = _model.message.map((e) => e.content).toList();
                                                                                        if (chat.isEmpty) {
                                                                                          return Center(
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              child: EmptyChatsWidget(),
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        return ListView.builder(
                                                                                          padding: EdgeInsets.fromLTRB(
                                                                                            0,
                                                                                            16.0,
                                                                                            0,
                                                                                            16.0,
                                                                                          ),
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: chat.length,
                                                                                          itemBuilder: (context, chatIndex) {
                                                                                            final chatItem = chat[chatIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Container(
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: () {
                                                                                                                if (MediaQuery.sizeOf(context).width >= 1170.0) {
                                                                                                                  return 700.0;
                                                                                                                } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                                                                                                                  return 330.0;
                                                                                                                } else {
                                                                                                                  return 530.0;
                                                                                                                }
                                                                                                              }(),
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(12.0),
                                                                                                                topLeft: Radius.circular(12.0),
                                                                                                                topRight: Radius.circular(12.0),
                                                                                                              ),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  RichText(
                                                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                                                    text: TextSpan(
                                                                                                                      children: [
                                                                                                                        TextSpan(
                                                                                                                          text: valueOrDefault<String>(
                                                                                                                            FFAppState().messages.firstOrNull?.userMessage,
                                                                                                                            'UserMessage',
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: 'WorkSans',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                                            child: InkWell(
                                                                                                              splashColor: Colors.transparent,
                                                                                                              focusColor: Colors.transparent,
                                                                                                              hoverColor: Colors.transparent,
                                                                                                              highlightColor: Colors.transparent,
                                                                                                              onTap: () async {
                                                                                                                logFirebaseEvent('CHAT_WITH_LUCILLE_VERSION5_Container_557');
                                                                                                                logFirebaseEvent('Container_copy_to_clipboard');
                                                                                                                await Clipboard.setData(ClipboardData(
                                                                                                                    text: valueOrDefault<String>(
                                                                                                                  chatIndex.toString(),
                                                                                                                  '--',
                                                                                                                )));
                                                                                                                logFirebaseEvent('Container_show_snack_bar');
                                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                  SnackBar(
                                                                                                                    content: Text(
                                                                                                                      'Response copied to clipboard.',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                                            fontSize: 12.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    duration: Duration(milliseconds: 2000),
                                                                                                                    backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 12.0, 4.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Icon(
                                                                                                                          Icons.content_copy,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 12.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          FFLocalizations.of(context).getText(
                                                                                                                            'emgeskpo' /* Copy response */,
                                                                                                                          ),
                                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                fontFamily: 'WorkSans',
                                                                                                                                letterSpacing: 0.0,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxWidth: () {
                                                                                                            if (MediaQuery.sizeOf(context).width >= 1170.0) {
                                                                                                              return 700.0;
                                                                                                            } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                                                                                                              return 330.0;
                                                                                                            } else {
                                                                                                              return 530.0;
                                                                                                            }
                                                                                                          }(),
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          borderRadius: BorderRadius.only(
                                                                                                            bottomLeft: Radius.circular(12.0),
                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                            topLeft: Radius.circular(12.0),
                                                                                                            topRight: Radius.circular(12.0),
                                                                                                          ),
                                                                                                          border: Border.all(
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              RichText(
                                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                                text: TextSpan(
                                                                                                                  children: [
                                                                                                                    TextSpan(
                                                                                                                      text: chatItem,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'WorkSans',
                                                                                                                            letterSpacing: 0.0,
                                                                                                                          ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: 'WorkSans',
                                                                                                                        letterSpacing: 0.0,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ).animateOnActionTrigger(
                                                                                                                animationsMap['richTextOnActionTriggerAnimation']!,
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                          controller: _model.listViewController,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (_model.aiIsResponsing == true)
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      wrapWithModel(
                                                                                        model: _model.writingIndicatorModel,
                                                                                        updateCallback: () => safeSetState(() {}),
                                                                                        child: WritingIndicatorWidget(),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        3.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Stack(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            40.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode,
                                                                        autofocus:
                                                                            true,
                                                                        textCapitalization:
                                                                            TextCapitalization.sentences,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            '1nlyvw00' /* Type something... */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: Color(0xB5D0E3F7),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          errorStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                          ),
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              24.0,
                                                                              70.0,
                                                                              24.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .override(
                                                                              fontFamily: 'WorkSans',
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        maxLines:
                                                                            8,
                                                                        minLines:
                                                                            1,
                                                                        keyboardType:
                                                                            TextInputType.multiline,
                                                                        cursorColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        validator: _model
                                                                            .textControllerValidator
                                                                            .asValidator(context),
                                                                        inputFormatters: [
                                                                          if (!isAndroid &&
                                                                              !isiOS)
                                                                            TextInputFormatter.withFunction((oldValue,
                                                                                newValue) {
                                                                              return TextEditingValue(
                                                                                selection: newValue.selection,
                                                                                text: newValue.text.toCapitalization(TextCapitalization.sentences),
                                                                              );
                                                                            }),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child:
                                                                        FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          60.0,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .send_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      showLoadingIndicator:
                                                                          true,
                                                                      onPressed:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'CHAT_WITH_LUCILLE_VERSION5_send_rounded_');
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_app_state');
                                                                        FFAppState()
                                                                            .addToMessages(LucilleStreamResponseFINALStruct(
                                                                          userMessage: _model
                                                                              .textController
                                                                              .text,
                                                                          role:
                                                                              Role.User,
                                                                        ));
                                                                        safeSetState(
                                                                            () {});
                                                                        logFirebaseEvent(
                                                                            'IconButton_backend_call');
                                                                        _model.lucilleStreamChat = await LucilleStreamingGroup
                                                                            .lucilleStreamingResponseCall
                                                                            .call(
                                                                          sessionID:
                                                                              FFAppState().chatSessionId,
                                                                          message: _model
                                                                              .textController
                                                                              .text,
                                                                        );
                                                                        if (_model.lucilleStreamChat?.succeeded ??
                                                                            true) {
                                                                          final streamSubscription = _model
                                                                              .lucilleStreamChat
                                                                              ?.streamedResponse
                                                                              ?.stream
                                                                              .transform(utf8.decoder)
                                                                              .transform(const LineSplitter())
                                                                              .transform(ServerSentEventLineTransformer())
                                                                              .map((m) => ResponseStreamMessage(message: m))
                                                                              .listen(
                                                                            (onMessageInput) async {
                                                                              if (_model.newMessage!) {
                                                                                logFirebaseEvent('_update_page_state');
                                                                                _model.newMessage = false;
                                                                                _model.addToMessage((getJsonField(
                                                                                  onMessageInput.serverSentEvent.jsonData,
                                                                                  r'''$.delta''',
                                                                                ).toList().map<LucilleStreamResponseFINALStruct?>(LucilleStreamResponseFINALStruct.maybeFromMap).toList() as Iterable<LucilleStreamResponseFINALStruct?>)
                                                                                    .withoutNulls
                                                                                    .firstOrNull!);
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('_update_app_state');
                                                                                FFAppState().addToMessages(LucilleStreamResponseFINALStruct(
                                                                                  content: LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.content,
                                                                                  done: false,
                                                                                  sessionId: LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.sessionId,
                                                                                  response: LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response,
                                                                                  messageCount: LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.messageCount,
                                                                                  role: Role.Lucille,
                                                                                ));
                                                                                safeSetState(() {});
                                                                                logFirebaseEvent('_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Stream Complete',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                logFirebaseEvent('_update_app_state');
                                                                                FFAppState().updateMessagesAtIndex(
                                                                                  LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!.messageCount,
                                                                                  (e) => e..content = LucilleStreamResponseFINALStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response,
                                                                                );
                                                                                safeSetState(() {});
                                                                              }

                                                                              logFirebaseEvent('_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Stream Recieved!',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                            },
                                                                            onError:
                                                                                (onErrorInput) async {
                                                                              logFirebaseEvent('_show_snack_bar');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Stream Error!',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                            },
                                                                            onDone:
                                                                                () async {
                                                                              logFirebaseEvent('_update_page_state');
                                                                              _model.addToChatMessages(_model.streamedResponse!);
                                                                              safeSetState(() {});
                                                                            },
                                                                          );
                                                                        }

                                                                        logFirebaseEvent(
                                                                            'IconButton_clear_text_fields_pin_codes');
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController
                                                                              ?.clear();
                                                                        });
                                                                        if ((_model.lucilleStreamChat?.succeeded ??
                                                                            true)) {
                                                                          logFirebaseEvent(
                                                                              'IconButton_update_page_state');
                                                                          _model.aiIsResponsing =
                                                                              false;
                                                                          _model.addToMessages(((_model.lucilleStreamChat?.jsonBody ?? '').toList().map<LucilleStreamResponseFINALStruct?>(LucilleStreamResponseFINALStruct.maybeFromMap).toList() as Iterable<LucilleStreamResponseFINALStruct?>)
                                                                              .withoutNulls
                                                                              .firstOrNull!
                                                                              .content);
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          logFirebaseEvent(
                                                                              'IconButton_show_snack_bar');
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Message Failed!',
                                                                                style: TextStyle(
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 4000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          );
                                                                        }

                                                                        logFirebaseEvent(
                                                                            'IconButton_scroll_to');
                                                                        await _model
                                                                            .listViewController
                                                                            ?.animateTo(
                                                                          _model
                                                                              .listViewController!
                                                                              .position
                                                                              .maxScrollExtent,
                                                                          duration:
                                                                              Duration(milliseconds: 100),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Container(
                                                              width: 100.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                            ),
                                                        ],
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
