import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chats_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
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
    extends State<ChatWithLucilleVersion5Widget>
    with TickerProviderStateMixin {}

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
          VisibilityEffect(duration: 220.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 220.0.ms,
            duration: 380.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'richTextOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 220.0.ms,
            duration: 1090.0.ms,
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
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

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
                                                          
                                                          print('Voice input: ${_model.returnedVoiceText}');
                                                          
                                                          if (_model.returnedVoiceText == null || 
                                                              _model.returnedVoiceText!.isEmpty) {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text('No voice input detected'),
                                                                duration: Duration(milliseconds: 2000),
                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                              ),
                                                            );
                                                            return;
                                                          }
                                                          
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
                                                          _model.voiceChatLucilleResponse1 = await LucilleStreamingGroup
                                                              .lucilleStreamingResponseCall
                                                              .call(
                                                            sessionID: FFAppState()
                                                                .chatSessionId,
                                                            message: _model
                                                                .returnedVoiceText,
                                                          );

                                                          print('API succeeded: ${_model.voiceChatLucilleResponse1?.succeeded}');
                                                          
                                                          if (_model.voiceChatLucilleResponse1?.succeeded ?? false) {
                                                            String accumulatedResponse = '';
                                                            
                                                            if (_model.voiceChatLucilleResponse1?.streamedResponse != null) {
                                                              final streamSubscription = _model.voiceChatLucilleResponse1!
                                                                  .streamedResponse!
                                                                  .stream
                                                                  .transform(utf8.decoder)
                                                                  .transform(const LineSplitter())
                                                                  .transform(ServerSentEventLineTransformer())
                                                                  .map((m) => ResponseStreamMessage(message: m))
                                                                  .listen(
                                                                    (onMessageInput) async {
                                                                      print('Stream message: ${onMessageInput.serverSentEvent.jsonData}');
                                                                      
                                                                      final delta = LucilleStreamingGroup
                                                                          .lucilleStreamingResponseCall
                                                                          .delta(
                                                                        onMessageInput.serverSentEvent.jsonData,
                                                                      );
                                                                      
                                                                      if (delta != null && delta.isNotEmpty) {
                                                                        accumulatedResponse += delta;
                                                                        print('Accumulated: $accumulatedResponse');
                                                                      }
                                                                    },
                                                                    onError: (error) {
                                                                      print('Stream error: $error');
                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(
                                                                          content: Text('Stream error occurred'),
                                                                          duration: Duration(milliseconds: 3000),
                                                                          backgroundColor: FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                      );
                                                                      
                                                                      FFAppState().isListening = false;
                                                                      FFAppState().update(() {});
                                                                      safeSetState(() {});
                                                                    },
                                                                    onDone: () async {
                                                                      print('Stream done. Final: $accumulatedResponse');
                                                                      
                                                                      if (accumulatedResponse.isNotEmpty) {
                                                                        logFirebaseEvent(
                                                                            'LottieAnimation_custom_action');
                                                                        await actions.speakText(accumulatedResponse);
                                                                        
                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(
                                                                            content: Text('Playing voice response...'),
                                                                            duration: Duration(milliseconds: 2000),
                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(
                                                                            content: Text('No response received'),
                                                                            duration: Duration(milliseconds: 3000),
                                                                            backgroundColor: FlutterFlowTheme.of(context).error,
                                                                          ),
                                                                        );
                                                                      }
                                                                      
                                                                      FFAppState().isListening = false;
                                                                      FFAppState().update(() {});
                                                                      safeSetState(() {});
                                                                    },
                                                                  );
                                                            } else {
                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                SnackBar(
                                                                  content: Text('No stream available'),
                                                                  duration: Duration(milliseconds: 3000),
                                                                  backgroundColor: FlutterFlowTheme.of(context).error,
                                                                ),
                                                              );
                                                              
                                                              FFAppState().isListening = false;
                                                              FFAppState().update(() {});
                                                              safeSetState(() {});
                                                            }
                                                          } else {
                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                content: Text('Failed to get response'),
                                                                duration: Duration(milliseconds: 3000),
                                                                backgroundColor: FlutterFlowTheme.of(context).error,
                                                              ),
                                                            );
                                                            
                                                            FFAppState().isListening = false;
                                                            FFAppState().update(() {});
                                                            safeSetState(() {});
                                                          }

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
                                                          elevation: 8.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25.0),
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
                                                                                        final chat = _model.streamMessages.toList();
                                                                                        if (chat.isEmpty) {
                                                                                          return Center(
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              child: EmptyChatsWidget(),
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        return ListView.builder(
                                                                                          key: ValueKey(_model.streamMessages.length),
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
                                                                                            print('Message $chatIndex: role=${chatItem.role}, content="${chatItem.content}"');
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  if (chatItem.role == Role.User)
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
                                                                                                                          text: chatItem.content,
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
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  if (chatItem.role == Role.Lucille)
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
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
                                                                                                                          text: chatItem.content,
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
                                                                                                        ],
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
                                                                      maxLines:
                                                                          8,
                                                                      minLines:
                                                                          1,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .multiline,
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
                                                                              selection: newValue.selection,
                                                                              text: newValue.text.toCapitalization(TextCapitalization.sentences),
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
                                                                        FFAppState().senderUser = _model
                                                                            .textController
                                                                            .text;
                                                                        
                                                                        // Store user message
                                                                        final userMessage = _model.textController.text;
                                                                        print('=== SEND BUTTON CLICKED ===');
                                                                        print('User message: $userMessage');
                                                                        print('Current streamMessages count: ${_model.streamMessages.length}');
                                                                        
                                                                        // Add user message to chat
                                                                        _model.addToStreamMessages(LucilleStreamFINALStruct(
                                                                          content: userMessage,
                                                                          role: Role.User,
                                                                          sessionId: FFAppState().chatSessionId,
                                                                        ));
                                                                        print('Added user message. New count: ${_model.streamMessages.length}');
                                                                        setState(() {});
                                                                        
                                                                        // Clear input field immediately
                                                                        _model.textController?.clear();
                                                                        
                                                                        logFirebaseEvent(
                                                                            'IconButton_backend_call');
                                                                        _model.lucilleStreamChat = await LucilleStreamingGroup
                                                                            .lucilleStreamingResponseCall
                                                                            .call(
                                                                          sessionID:
                                                                              FFAppState().chatSessionId,
                                                                          message: userMessage,
                                                                        );
                                                                        
                                                                        print('API call completed. Success: ${_model.lucilleStreamChat?.succeeded}');
                                                                        
                                                                        if (_model.lucilleStreamChat?.succeeded ??
                                                                            true) {
                                                                          String accumulatedResponse = '';
                                                                          bool needsUpdate = false;
                                                                          
                                                                          // Add placeholder for AI response
                                                                          _model.addToStreamMessages(LucilleStreamFINALStruct(
                                                                            content: '',
                                                                            role: Role.Lucille,
                                                                            sessionId: FFAppState().chatSessionId,
                                                                          ));
                                                                          final aiMessageIndex = _model.streamMessages.length - 1;
                                                                          setState(() {});
                                                                          
                                                                          // Throttle UI updates to every 100ms
                                                                          Timer? updateTimer;
                                                                          
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
                                                                              final delta = LucilleStreamingGroup
                                                                                  .lucilleStreamingResponseCall
                                                                                  .delta(onMessageInput.serverSentEvent.jsonData);
                                                                              
                                                                              if (delta != null && delta.isNotEmpty) {
                                                                                accumulatedResponse += delta;
                                                                                needsUpdate = true;
                                                                                
                                                                                // Cancel existing timer
                                                                                updateTimer?.cancel();
                                                                                
                                                                                // Schedule UI update
                                                                                updateTimer = Timer(Duration(milliseconds: 100), () {
                                                                                  if (mounted && needsUpdate) {
                                                                                    setState(() {
                                                                                      _model.updateStreamMessagesAtIndex(
                                                                                        aiMessageIndex,
                                                                                        (msg) => msg..content = accumulatedResponse,
                                                                                      );
                                                                                      needsUpdate = false;
                                                                                    });
                                                                                  }
                                                                                });
                                                                              }
                                                                            },
                                                                            onError:
                                                                                (onErrorInput) async {
                                                                              print('Text chat stream error: $onErrorInput');
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text('Stream Error!'),
                                                                                  duration: Duration(milliseconds: 3000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).error,
                                                                                ),
                                                                              );
                                                                            },
                                                                            onDone:
                                                                                () async {
                                                                              updateTimer?.cancel();
                                                                              
                                                                              // Final update
                                                                              if (mounted && accumulatedResponse.isNotEmpty) {
                                                                                setState(() {
                                                                                  _model.updateStreamMessagesAtIndex(
                                                                                    aiMessageIndex,
                                                                                    (msg) => msg..content = accumulatedResponse,
                                                                                  );
                                                                                });
                                                                              }
                                                                              
                                                                              // Scroll to bottom
                                                                              await Future.delayed(Duration(milliseconds: 100));
                                                                              await _model.listViewController?.animateTo(
                                                                                _model.listViewController!.position.maxScrollExtent,
                                                                                duration: Duration(milliseconds: 300),
                                                                                curve: Curves.easeOut,
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text('Failed to get response'),
                                                                              duration: Duration(milliseconds: 3000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).error,
                                                                            ),
                                                                          );
                                                                        }

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
