import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chats_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_commons/api_requests/api_streaming.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/7b5466eebefd1ecf1b8b13a24cd282703941d5c8.png',
                    ).image,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 795.9,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x41EDF1F7),
                        FlutterFlowTheme.of(context).tertiary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
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
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2gn348g9' /* Chat with Lucille */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'The Seasons',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 26.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                                      return WebViewAware(
                                        child: GestureDetector(
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
                                            'ottskynf' /* Talk with Lucille */,
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
                                            'zy86zp88' /* Chat with Lucille */,
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
                                          Flexible(
                                            flex: 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 300.0, 0.0, 0.0),
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 230),
                                                  curve: Curves.easeOut,
                                                  width: 129.0,
                                                  height: 120.0,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 80.0,
                                                        color:
                                                            Color(0xA6FCC462),
                                                        offset: Offset(
                                                          0.0,
                                                          0.0,
                                                        ),
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
                                                      logFirebaseEvent(
                                                          'CHAT_WITH_LUCILLE_VERSION5_LottieAnimati');
                                                      logFirebaseEvent(
                                                          'LottieAnimation_request_permissions');
                                                      await requestPermission(
                                                          microphonePermission);
                                                      logFirebaseEvent(
                                                          'LottieAnimation_start_audio_recording');
                                                      await startAudioRecording(
                                                        context,
                                                        audioRecorder: _model
                                                                .audioRecorder ??=
                                                            AudioRecorder(),
                                                      );

                                                      logFirebaseEvent(
                                                          'LottieAnimation_update_page_state');
                                                      _model.isRecording = true;
                                                      safeSetState(() {});
                                                    },
                                                    onDoubleTap: () async {
                                                      logFirebaseEvent(
                                                          'CHAT_WITH_LUCILLE_VERSION5_LottieAnimati');
                                                      logFirebaseEvent(
                                                          'LottieAnimation_stop_audio_recording');
                                                      await stopAudioRecording(
                                                        audioRecorder: _model
                                                            .audioRecorder,
                                                        audioName:
                                                            'recordedFileBytes',
                                                        onRecordingComplete:
                                                            (audioFilePath,
                                                                audioBytes) {
                                                          _model.stopUserVoice =
                                                              audioFilePath;
                                                          _model.recordedFileBytes =
                                                              audioBytes;
                                                        },
                                                      );

                                                      logFirebaseEvent(
                                                          'LottieAnimation_backend_call');
                                                      _model.speechToText =
                                                          await LucilleVoiceChatGroup
                                                              .speechToTextCall
                                                              .call(
                                                        audio: _model
                                                            .stopUserVoice,
                                                      );

                                                      logFirebaseEvent(
                                                          'LottieAnimation_update_page_state');
                                                      _model.recordedAudioBase64 =
                                                          _model.stopUserVoice;
                                                      _model.isRecording =
                                                          false;
                                                      _model
                                                          .voiceTextUser = (_model
                                                                  .speechToText
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString();
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'LottieAnimation_backend_call');
                                                      _model.speechToTextChatResponse =
                                                          await TheoryOfMindLucilleGroup
                                                              .lucilleChatMainCall
                                                              .call(
                                                        message: (_model
                                                                    .speechToText
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toString(),
                                                        sessionId: FFAppState()
                                                            .chatSessionId,
                                                        userId: currentUserUid,
                                                      );

                                                      logFirebaseEvent(
                                                          'LottieAnimation_backend_call');
                                                      _model.ttsResponse =
                                                          await LucilleVoiceChatGroup
                                                              .textToSpeechCall
                                                              .call(
                                                        text: (_model
                                                                .speechToTextChatResponse
                                                                ?.bodyText ??
                                                            ''),
                                                        voice:
                                                            'en-US-AriaNeural',
                                                      );

                                                      logFirebaseEvent(
                                                          'LottieAnimation_custom_action');
                                                      _model.base64AudioConversion =
                                                          await actions
                                                              .base64ToAudioFile(
                                                        (_model.ttsResponse
                                                                ?.bodyText ??
                                                            ''),
                                                      );
                                                      logFirebaseEvent(
                                                          'LottieAnimation_update_page_state');
                                                      _model.lucilleBase64ConvertedFile =
                                                          (_model.ttsResponse
                                                                      ?.jsonBody ??
                                                                  '')
                                                              .toString();
                                                      safeSetState(() {});

                                                      safeSetState(() {});
                                                    },
                                                    child: Lottie.asset(
                                                      'assets/jsons/Enable_mic.json',
                                                      width: 209.6,
                                                      height: 334.3,
                                                      fit: BoxFit.contain,
                                                      reverse: true,
                                                      animate: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.0,
                                            child: FlutterFlowAudioPlayer(
                                              audio: Audio.network(
                                                _model
                                                    .lucilleBase64ConvertedFile!,
                                                metas: Metas(
                                                  title: 'Title',
                                                ),
                                              ),
                                              titleTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            'The Seasons',
                                                        letterSpacing: 0.0,
                                                      ),
                                              playbackDurationTextStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        letterSpacing: 0.0,
                                                      ),
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              playbackButtonColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              elevation: 0.0,
                                              playInBackground: PlayInBackground
                                                  .disabledPause,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mjhdx6r3' /* Tap the mic to talk directly w... */,
                                                      ),
                                                      options: FFButtonOptions(
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
                                                        color:
                                                            Color(0x59EDF1F7),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          shadows: [
                                                            Shadow(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              offset: Offset(
                                                                  8.0, 8.0),
                                                              blurRadius: 8.0,
                                                            )
                                                          ],
                                                        ),
                                                        elevation: 8.0,
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x7CEDF1F7),
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25.0),
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
                                    KeepAliveWidgetWrapper(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 770.0,
                                                ),
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                              tablet: false,
                                                            ))
                                                              Container(
                                                                width: 100.0,
                                                                height: 24.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        0.0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  child:
                                                                      BackdropFilter(
                                                                    filter:
                                                                        ImageFilter
                                                                            .blur(
                                                                      sigmaX:
                                                                          5.0,
                                                                      sigmaY:
                                                                          4.0,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            flex:
                                                                                1,
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, -1.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final chat = FFAppState().messagesTheoryOfMind.toList();
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
                                                                                        child: SingleChildScrollView(
                                                                                          primary: false,
                                                                                          controller: _model.columnController1,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                          child: Container(
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
                                                                                                                topLeft: Radius.circular(12.0),
                                                                                                                topRight: Radius.circular(12.0),
                                                                                                                bottomRight: Radius.circular(12.0),
                                                                                                              ),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                width: 2.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                              child: SingleChildScrollView(
                                                                                                                primary: false,
                                                                                                                controller: _model.columnController2,
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    RichText(
                                                                                                                      textScaler: MediaQuery.of(context).textScaler,
                                                                                                                      text: TextSpan(
                                                                                                                        children: [
                                                                                                                          TextSpan(
                                                                                                                            text: FFAppState().messagesTheoryOfMind.contains(FFAppState().messagesTheoryOfMind.where((e) => Role.User != null).toList().firstOrNull).toString(),
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
                                                                                                              logFirebaseEvent('CHAT_WITH_LUCILLE_VERSION5_Container_yqe');
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
                                                                                                                          'c5tkngm0' /* Copy response */,
                                                                                                                        ),
                                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                              fontFamily: 'WorkSans',
                                                                                                                              color: FlutterFlowTheme.of(context).secondary,
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
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Container(
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
                                                                                                          topLeft: Radius.circular(12.0),
                                                                                                          topRight: Radius.circular(12.0),
                                                                                                          bottomLeft: Radius.circular(12.0),
                                                                                                        ),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                        child: SingleChildScrollView(
                                                                                                          primary: false,
                                                                                                          controller: _model.columnController3,
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                flex: 1,
                                                                                                                child: Container(
                                                                                                                  width: double.infinity,
                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                                                  child: custom_widgets.GptMarkdownWidget(
                                                                                                                    width: double.infinity,
                                                                                                                    height: MediaQuery.sizeOf(context).height * 0.15,
                                                                                                                    data: chatItem.content,
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
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    controller: _model.listViewController,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (_model.aiIsResponsing ==
                                                                              true)
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            12.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 3.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
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
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        true,
                                                                    enabled:
                                                                        true,
                                                                    textCapitalization:
                                                                        TextCapitalization
                                                                            .sentences,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        '2h0hy3by' /* Type something... */,
                                                                      ),
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                Color(0xB5D0E3F7),
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      errorStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              2.0,
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
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    maxLines: 8,
                                                                    minLines: 1,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    validator: _model
                                                                        .textControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      if (!isAndroid &&
                                                                          !isiOS)
                                                                        TextInputFormatter.withFunction((oldValue,
                                                                            newValue) {
                                                                          return TextEditingValue(
                                                                            selection:
                                                                                newValue.selection,
                                                                            text:
                                                                                newValue.text.toCapitalization(TextCapitalization.sentences),
                                                                          );
                                                                        }),
                                                                    ],
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
                                                                    icon: Icon(
                                                                      Icons
                                                                          .send_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
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
                                                                          'IconButton_backend_call');
                                                                      _model.getChatHistory = await TheoryOfMindSessionManagementGroup
                                                                          .getChatHistoryCall
                                                                          .call(
                                                                        sessionID:
                                                                            FFAppState().chatSessionId,
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'IconButton_update_app_state');
                                                                      FFAppState()
                                                                              .senderUser =
                                                                          _model
                                                                              .textController
                                                                              .text;
                                                                      FFAppState()
                                                                          .addToMessagesTheoryOfMind(
                                                                              TheoryOfMindLucilleStreamChatStruct(
                                                                        content: _model
                                                                            .textController
                                                                            .text,
                                                                        done:
                                                                            false,
                                                                        sessionId:
                                                                            FFAppState().chatSessionId,
                                                                        detectedEmotion: valueOrDefault(
                                                                            currentUserDocument?.currentMood,
                                                                            ''),
                                                                        response:
                                                                            '',
                                                                        detectedIntent:
                                                                            'Chat',
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'IconButton_backend_call');
                                                                      _model.lucilleStreamChat = await TheoryOfMindLucilleGroup
                                                                          .chatStreamCall
                                                                          .call(
                                                                        sessionID:
                                                                            FFAppState().chatSessionId,
                                                                        message:
                                                                            _model.userInput,
                                                                        userID:
                                                                            currentUserUid,
                                                                      );
                                                                      if (_model
                                                                              .lucilleStreamChat
                                                                              ?.succeeded ??
                                                                          true) {
                                                                        final streamSubscription = _model
                                                                            .lucilleStreamChat
                                                                            ?.streamedResponse
                                                                            ?.stream
                                                                            .transform(utf8
                                                                                .decoder)
                                                                            .transform(
                                                                                const LineSplitter())
                                                                            .transform(
                                                                                ServerSentEventLineTransformer())
                                                                            .map((m) =>
                                                                                ResponseStreamMessage(message: m))
                                                                            .listen(
                                                                          (onMessageInput) async {
                                                                            if (_model.newMessage!) {
                                                                              logFirebaseEvent('_update_page_state');
                                                                              _model.newMessage = false;
                                                                              safeSetState(() {});
                                                                              logFirebaseEvent('_update_app_state');
                                                                              FFAppState().addToMessagesTheoryOfMind(TheoryOfMindLucilleStreamChatStruct(
                                                                                content: TheoryOfMindLucilleGroup.chatStreamCall.content(
                                                                                  onMessageInput.serverSentEvent.jsonData,
                                                                                ),
                                                                                done: TheoryOfMindLucilleGroup.chatStreamCall.done(
                                                                                  onMessageInput.serverSentEvent.jsonData,
                                                                                ),
                                                                                sessionId: TheoryOfMindLucilleGroup.chatStreamCall.sessionID(
                                                                                  onMessageInput.serverSentEvent.jsonData,
                                                                                ),
                                                                                response: onMessageInput.serverSentEvent.jsonData.toString(),
                                                                                messageCount: TheoryOfMindLucilleGroup.chatStreamCall.messageCount(
                                                                                  onMessageInput.serverSentEvent.jsonData,
                                                                                ),
                                                                              ));
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              logFirebaseEvent('_update_app_state');
                                                                              FFAppState().updateMessagesTheoryOfMindAtIndex(
                                                                                TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)!.messageCount,
                                                                                (e) => e
                                                                                  ..content = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.content
                                                                                  ..done = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.done
                                                                                  ..sessionId = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.sessionId
                                                                                  ..messageCount = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.messageCount
                                                                                  ..response = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.response
                                                                                  ..detectedEmotion = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.detectedEmotion
                                                                                  ..detectedIntent = TheoryOfMindLucilleStreamChatStruct.maybeFromMap(onMessageInput.serverSentEvent.jsonData)?.detectedIntent,
                                                                              );
                                                                              safeSetState(() {});
                                                                            }
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
                                                                            _model.aiIsResponsing =
                                                                                false;
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
                                                                      if (TheoryOfMindLucilleGroup
                                                                          .chatStreamCall
                                                                          .done(
                                                                        (_model.lucilleStreamChat?.jsonBody ??
                                                                            ''),
                                                                      )!) {
                                                                        logFirebaseEvent(
                                                                            'IconButton_update_page_state');
                                                                        _model
                                                                            .streamedResponse = LucilleStreamFINALStruct.maybeFromMap((_model.lucilleStreamChat?.jsonBody ??
                                                                                ''))
                                                                            ?.response;
                                                                        _model.aiMessageIndex = _model
                                                                            .streamMessages
                                                                            .length;
                                                                        _model.insertAtIndexInStreamMessages(
                                                                            TheoryOfMindLucilleStreamChatStruct.maybeFromMap((_model.lucilleStreamChat?.jsonBody ?? ''))!.messageCount,
                                                                            ((_model.lucilleStreamChat?.jsonBody ?? '').toList().map<TheoryOfMindLucilleStreamChatStruct?>(TheoryOfMindLucilleStreamChatStruct.maybeFromMap).toList() as Iterable<TheoryOfMindLucilleStreamChatStruct?>).withoutNulls.firstOrNull!);
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'IconButton_show_snack_bar');
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Message Failed!',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
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
                                                                        curve: Curves
                                                                            .ease,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
