import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chats_widget.dart';
import '/components/response_assessment_comp_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/lucille_g_p_t_comp/writing_indicator/writing_indicator_widget.dart';
import 'dart:convert';
import 'dart:ui';
import '/app_events/index.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
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
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_with_lucille_version5_model.dart';
export 'chat_with_lucille_version5_model.dart';

class ChatWithLucilleVersion5Widget extends StatefulWidget {
  const ChatWithLucilleVersion5Widget({super.key});

  static String routeName = 'ChatWithLucilleVersion5';
  static String routePath = '/chatWithLucilleVersion5';

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
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1560.0.ms,
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
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/e3bedab340c6acae47e0f98a0b163900.gif',
                    ).image,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 80.0,
                      sigmaY: 80.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 817.9,
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
                                Flexible(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'tsobl4rd' /* Chat with Lucille */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.cormorantSc(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 26.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
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
                                          return WebViewAware(
                                            child: GestureDetector(
                                              onTap: () {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
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
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 770.0,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                              ))
                                                Container(
                                                  width: 100.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(),
                                                ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 5.0,
                                                        sigmaY: 4.0,
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              flex: 1,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final chat = _model
                                                                        .chatMessages
                                                                        .toList();
                                                                    if (chat
                                                                        .isEmpty) {
                                                                      return Center(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              EmptyChatsWidget(),
                                                                        ),
                                                                      );
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .fromLTRB(
                                                                        0,
                                                                        16.0,
                                                                        0,
                                                                        16.0,
                                                                      ),
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          chat.length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              chatIndex) {
                                                                        final chatItem =
                                                                            chat[chatIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              12.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            primary:
                                                                                false,
                                                                            controller:
                                                                                _model.columnController1,
                                                                            child:
                                                                                Column(
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
                                                                                              child: PixelDissolveShaderWrap(
                                                                                                params: ShaderParams(values: {
                                                                                                  'angle': 14.0,
                                                                                                  'scale': 1.0,
                                                                                                  'offset': 0.0,
                                                                                                  'pixelSize': 5.11,
                                                                                                  'edgeWidth': 0.35,
                                                                                                  'scatter': 0.36,
                                                                                                  'noiseAmount': 0.93,
                                                                                                  'speed': 0.21
                                                                                                }),
                                                                                                animationMode: ShaderAnimationMode.explicit,
                                                                                                animationConfig: ShaderAnimationConfig(duration: Duration(milliseconds: (2100.0).round()), curve: Curves.easeIn, invert: true),
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
                                                                                                                text: _model.userMessages.elementAtOrNull(chatIndex) ?? '',
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
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('CHAT_WITH_LUCILLE_VERSION5_Container_0rn');
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
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                            'w471more' /* Copy response */,
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
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
                                                                                        child: PixelDissolveShaderWrap(
                                                                                          params: ShaderParams(values: {
                                                                                            'angle': 14.0,
                                                                                            'scale': 1.0,
                                                                                            'offset': 0.0,
                                                                                            'pixelSize': 5.11,
                                                                                            'edgeWidth': 0.35,
                                                                                            'scatter': 0.36,
                                                                                            'noiseAmount': 0.93,
                                                                                            'speed': 0.21
                                                                                          }),
                                                                                          animationMode: ShaderAnimationMode.explicit,
                                                                                          animationConfig: ShaderAnimationConfig(duration: Duration(milliseconds: (4000.0).round()), curve: Curves.easeIn, invert: true),
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
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(12.0),
                                                                                                topRight: Radius.circular(12.0),
                                                                                                bottomLeft: Radius.circular(12.0),
                                                                                              ),
                                                                                              border: Border.all(
                                                                                                color: Color(0x45EDF1F7),
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
                                                                                                    custom_widgets.GptMarkdownWidget(
                                                                                                      width: double.infinity,
                                                                                                      height: null,
                                                                                                      data: _model.streamMessages.elementAtOrNull(chatIndex)?.content ?? '',
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
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
                                                                      controller:
                                                                          _model
                                                                              .listViewController,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model
                                                                    .aiIsResponsing ==
                                                                true)
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  wrapWithModel(
                                                                    model: _model
                                                                        .writingIndicatorModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        WritingIndicatorWidget(),
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
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    1.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller:
                                                          _model.textController,
                                                      focusNode: _model
                                                          .textFieldFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: true,
                                                      enabled: true,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'j5p4d3kn' /* Type something... */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                        errorStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    24.0,
                                                                    70.0,
                                                                    24.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                      maxLines: 8,
                                                      minLines: 1,
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      validator: _model
                                                          .textControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        if (!isAndroid &&
                                                            !isiOS)
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            return TextEditingValue(
                                                              selection: newValue
                                                                  .selection,
                                                              text: newValue
                                                                  .text
                                                                  .toCapitalization(
                                                                      TextCapitalization
                                                                          .sentences),
                                                            );
                                                          }),
                                                      ],
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 60.0,
                                                      hoverColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      hoverIconColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      hoverBorderColor:
                                                          Color(0x47EDF1F7),
                                                      icon: Icon(
                                                        Icons.send_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'CHAT_WITH_LUCILLE_VERSION5_send_rounded_');
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        _model.getChatHistory =
                                                            await TheoryOfMindSessionManagementGroup
                                                                .getChatHistoryCall
                                                                .call(
                                                          sessionID: FFAppState()
                                                              .chatSessionId,
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
                                                          done: false,
                                                          sessionId: FFAppState()
                                                              .chatSessionId,
                                                          detectedEmotion:
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.currentMood,
                                                                  ''),
                                                          response: '',
                                                          detectedIntent:
                                                              'Chat',
                                                        ));
                                                        _model.addToUserMessages(
                                                            _model
                                                                .textController
                                                                .text);
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        _model.conversationHistory =
                                                            await TheoryOfMindLucilleGroup
                                                                .lucilleChatMainCall
                                                                .call(
                                                          sessionId: FFAppState()
                                                              .chatSessionId,
                                                          userId:
                                                              currentUserUid,
                                                        );

                                                        logFirebaseEvent(
                                                            'IconButton_backend_call');
                                                        _model.newMessage =
                                                            true;
                                                        _model.lucilleStreamChat =
                                                            await TheoryOfMindLucilleGroup
                                                                .chatStreamCall
                                                                .call(
                                                          sessionID: FFAppState()
                                                              .chatSessionId,
                                                          message: _model
                                                              .textController
                                                              .text,
                                                          userID:
                                                              currentUserUid,
                                                          firebaseIDToken:
                                                              currentJwtToken,
                                                        );
                                                        if (_model
                                                                .lucilleStreamChat
                                                                ?.succeeded ??
                                                            true) {
                                                          final streamSubscription = _model
                                                              .lucilleStreamChat
                                                              ?.streamedResponse
                                                              ?.stream
                                                              .transform(
                                                                  utf8.decoder)
                                                              .transform(
                                                                  const LineSplitter())
                                                              .transform(
                                                                  ServerSentEventLineTransformer())
                                                              .map((m) =>
                                                                  ResponseStreamMessage(
                                                                      message:
                                                                          m))
                                                              .listen(
                                                            (onMessageInput) async {
                                                              print(
                                                                  'DEBUG SSE raw message: ${onMessageInput.message}');
                                                              print(
                                                                  'DEBUG SSE raw chunk: ${onMessageInput.serverSentEvent.jsonData}');
                                                              final data =
                                                                  TheoryOfMindLucilleStreamChatStruct
                                                                      .maybeFromMap(
                                                                onMessageInput
                                                                    .serverSentEvent
                                                                    .jsonData,
                                                              );
                                                              if (data == null) {
                                                                print(
                                                                    'DEBUG SSE parse failed: data is null after maybeFromMap');
                                                                return;
                                                              }
                                                              print(
                                                                  'DEBUG SSE parsed content: "${data.content}" done: ${data.done}');

                                                              if (_model
                                                                  .newMessage!) {
                                                                // First chunk: add new AI message
                                                                _model.newMessage =
                                                                    false;
                                                                _model
                                                                    .addToStreamMessages(
                                                                  TheoryOfMindLucilleStreamChatStruct(
                                                                    content:
                                                                        data.content ??
                                                                            '',
                                                                    done: data
                                                                            .done ??
                                                                        false,
                                                                    sessionId: data
                                                                        .sessionId,
                                                                    response: data
                                                                        .response,
                                                                    detectedEmotion:
                                                                        data.detectedEmotion,
                                                                    detectedIntent:
                                                                        data.detectedIntent,
                                                                  ),
                                                                );
                                                                _model.addToChatMessages(
                                                                    data.content ??
                                                                        '');
                                                              } else {
                                                                // Subsequent chunks: append to last AI message
                                                                final lastIndex =
                                                                    _model.streamMessages
                                                                            .length -
                                                                        1;
                                                                if (lastIndex >=
                                                                    0) {
                                                                  _model
                                                                      .updateStreamMessagesAtIndex(
                                                                    lastIndex,
                                                                    (e) => e
                                                                      ..content = (e.content ??
                                                                              '') +
                                                                          (data.content ??
                                                                              '')
                                                                      ..done =
                                                                          data.done ??
                                                                              false
                                                                      ..response =
                                                                          data.response
                                                                      ..detectedEmotion =
                                                                          data.detectedEmotion
                                                                      ..detectedIntent =
                                                                          data.detectedIntent,
                                                                  );
                                                                  if (_model
                                                                      .chatMessages
                                                                      .isNotEmpty) {
                                                                    _model
                                                                        .updateChatMessagesAtIndex(
                                                                      _model.chatMessages
                                                                              .length -
                                                                          1,
                                                                      (e) =>
                                                                          e +
                                                                          (data.content ??
                                                                              ''),
                                                                    );
                                                                  }
                                                                }
                                                              }
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            onError:
                                                                (onErrorInput) async {
                                                              print(
                                                                  'DEBUG SSE stream onError: $onErrorInput');
                                                              logFirebaseEvent(
                                                                  '_show_snack_bar');
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content: Text(
                                                                    'Stream Error!',
                                                                    style:
                                                                        TextStyle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                                  ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          4000),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                ),
                                                              );
                                                            },
                                                            onDone: () async {
                                                              print(
                                                                  'DEBUG SSE stream onDone fired');
                                                              _model.aiIsResponsing =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              if (currentJwtToken !=
                                                                  '') {
                                                                logFirebaseEvent(
                                                                    '_update_app_state');
                                                                FFAppState()
                                                                        .firebaseIDToken =
                                                                    currentJwtToken;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    '_show_snack_bar');
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Error creating another Firebase Token. Please wait....',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                        }

                                                        logFirebaseEvent(
                                                            'IconButton_clear_text_fields_pin_codes');
                                                        safeSetState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                        logFirebaseEvent(
                                                            'IconButton_trigger_app_event');
                                                        FFAppEventService
                                                            .instance
                                                            .triggerAppEvent(
                                                          ChatSentEvent(
                                                            data:
                                                                AiResponseStruct(
                                                              message:
                                                                  TheoryOfMindLucilleGroup
                                                                      .chatStreamCall
                                                                      .content(
                                                                (_model.lucilleStreamChat
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ),
                                                              type: 'Episodic',
                                                            ),
                                                            timestamp:
                                                                DateTime.now(),
                                                            waitForCompletion:
                                                                true,
                                                            debugId: '3',
                                                          ),
                                                        );

                                                        logFirebaseEvent(
                                                            'IconButton_trigger_app_event');
                                                        FFAppEventService
                                                            .instance
                                                            .triggerAppEvent(
                                                          AiRecommendationReadyEvent(
                                                            timestamp:
                                                                DateTime.now(),
                                                            waitForCompletion:
                                                                true,
                                                            debugId: '8',
                                                          ),
                                                        );

                                                        logFirebaseEvent(
                                                            'IconButton_trigger_app_event');
                                                        FFAppEventService
                                                            .instance
                                                            .triggerAppEvent(
                                                          AiThinkingEvent(
                                                            timestamp:
                                                                DateTime.now(),
                                                            waitForCompletion:
                                                                false,
                                                            debugId: '8',
                                                          ),
                                                        );

                                                        if ((_model
                                                                .lucilleStreamChat
                                                                ?.succeeded ??
                                                            true)) {
                                                          safeSetState(() {});
                                                        } else {
                                                          logFirebaseEvent(
                                                              'IconButton_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Lucille is having a moment... Try again.',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        logFirebaseEvent(
                                                            'IconButton_scroll_to');
                                                        if (_model
                                                                .listViewController
                                                                ?.hasClients ??
                                                            false) {
                                                          await _model
                                                              .listViewController
                                                              ?.animateTo(
                                                            _model
                                                                .listViewController!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );
                                                        }
                                                        if (false) {
                                                          logFirebaseEvent(
                                                              'IconButton_bottom_sheet');
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus();
                                                                    FocusManager
                                                                        .instance
                                                                        .primaryFocus
                                                                        ?.unfocus();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        ResponseAssessmentCompWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          logFirebaseEvent(
                                                              'IconButton_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .clearSnackBars();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Try asking more questions and we can set up an assessment to help us give better responses!',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                            ),
                                                          );
                                                        }

                                                        safeSetState(() {});
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
                                          decoration: BoxDecoration(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}