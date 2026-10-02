import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:material_palette/material_palette.dart';
import 'package:provider/provider.dart';
import 'new_sign_in_version5_model.dart';
export 'new_sign_in_version5_model.dart';

class NewSignInVersion5Widget extends StatefulWidget {
  const NewSignInVersion5Widget({
    super.key,
    this.tabIndexLogin,
  });

  final int? tabIndexLogin;

  static String routeName = 'NewSignInVersion5';
  static String routePath = '/newLogInVersion5';

  @override
  State<NewSignInVersion5Widget> createState() =>
      _NewSignInVersion5WidgetState();
}

class _NewSignInVersion5WidgetState extends State<NewSignInVersion5Widget> {
  late NewSignInVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewSignInVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'NewSignInVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NEW_SIGN_IN_VERSION5_NewSignInVersion5_O');
      logFirebaseEvent('NewSignInVersion5_haptic_feedback');
      HapticFeedback.vibrate();
      logFirebaseEvent('NewSignInVersion5_play_sound');
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(1.0);
      _model.soundPlayer1!
          .setAsset(
              'assets/audios/lucadialessandro-calm-ambient-intro-490646.mp3')
          .then((_) => _model.soundPlayer1!.play());
    });

    _model.loginEmailTextController ??= TextEditingController();
    _model.loginEmailFocusNode ??= FocusNode();

    _model.loginPasswordTextController ??= TextEditingController();
    _model.loginPasswordFocusNode ??= FocusNode();

    _model.displayNameTextController ??= TextEditingController();
    _model.displayNameFocusNode ??= FocusNode();

    _model.createEmailTextController ??= TextEditingController();
    _model.createEmailFocusNode ??= FocusNode();

    _model.createPasswordTextController ??= TextEditingController();
    _model.createPasswordFocusNode ??= FocusNode();

    _model.confirmPasswordTextController ??= TextEditingController();
    _model.confirmPasswordFocusNode ??= FocusNode();
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
            Expanded(
              child: Container(
                width: double.infinity,
                height: 500.0,
                child: Stack(
                  children: [
                    PageView(
                      controller: _model.pageViewController ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF6B5B95),
                                      Color(0xFF4A90E2)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                                        width: double.infinity,
                                        height: 878.3,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 880.9,
                                      decoration: BoxDecoration(),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: Container(
                                            width: 100.0,
                                            height: 128.8,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0x46EDF1F7),
                                                  Color(0x46D0E3F7),
                                                  Color(0x8F8C70BE),
                                                  Color(0x7A2196F3)
                                                ],
                                                stops: [0.0, 0.5, 0.75, 1.0],
                                                begin: AlignmentDirectional(
                                                    1.0, -0.64),
                                                end: AlignmentDirectional(
                                                    -1.0, 0.64),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 24.0, 24.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                  PixelDissolveShaderWrap(
                                                    params:
                                                        ShaderParams(values: {
                                                      'angle': 14.0,
                                                      'offset': 0.0,
                                                      'pixelSize': 5.11,
                                                      'edgeWidth': 0.35,
                                                      'scatter': 0.36,
                                                      'noiseAmount': 0.93,
                                                      'speed': 0.21,
                                                      'scale': 0.22
                                                    }),
                                                    animationMode:
                                                        ShaderAnimationMode
                                                            .explicit,
                                                    animationConfig:
                                                        ShaderAnimationConfig(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    (2000.0)
                                                                        .round()),
                                                            curve:
                                                                Curves.easeIn,
                                                            invert: true),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Hero(
                                                          tag: 'logo',
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Logo_ESCAPE_DarkBlue.png',
                                                              width: 200.0,
                                                              height: 76.4,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xhxl9n8g' /* Enter your cosmic dimension */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                  ClickableRippleShaderWrap(
                                                    params:
                                                        ShaderParams(values: {
                                                      'amplitude': 0.07,
                                                      'decay': 4.0,
                                                      'speed': 2.0,
                                                      'rippleDuration': 3.0,
                                                      'frequency': 12.35
                                                    }, colors: {
                                                      'bgColor':
                                                          Color(0x39EDF1F7)
                                                    }),
                                                    animationMode:
                                                        ShaderAnimationMode
                                                            .continuous,
                                                    interactive: true,
                                                    tapConfig:
                                                        ShaderAnimationConfig(
                                                            curve: Curves
                                                                .easeInOut,
                                                            invert: false),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 3.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x16EDF1F7),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 20.0,
                                                              color: Color(
                                                                  0x85D0E3F7),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                              spreadRadius:
                                                                  15.0,
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xA2D0E3F7),
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: Form(
                                                            key:
                                                                _model.formKey2,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          20.0,
                                                                          20.0,
                                                                          20.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'njzz1jqv' /* Email */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.cormorantSc(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.loginEmailTextController,
                                                                          focusNode:
                                                                              _model.loginEmailFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.loginEmailTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () =>
                                                                                safeSetState(() {}),
                                                                          ),
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            logFirebaseEvent('NEW_SIGN_IN_VERSION5_LoginEmail_ON_TEXTF');
                                                                            logFirebaseEvent('LoginEmail_haptic_feedback');
                                                                            HapticFeedback.selectionClick();
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          textInputAction:
                                                                              TextInputAction.done,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              '66vn2xlq' /* Enter Your Cosmic Identity */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x66FFFFFF),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Color(0x33FFFFFF),
                                                                            suffixIcon: _model.loginEmailTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.loginEmailTextController?.clear();
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      size: 22,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.emailAddress,
                                                                          enableInteractiveSelection:
                                                                              true,
                                                                          validator: _model
                                                                              .loginEmailTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'tme1t7hv' /* Password */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              font: GoogleFonts.cormorantSc(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.loginPasswordTextController,
                                                                          focusNode:
                                                                              _model.loginPasswordFocusNode,
                                                                          onFieldSubmitted:
                                                                              (_) async {
                                                                            logFirebaseEvent('NEW_SIGN_IN_VERSION5_LoginPassword_ON_TE');
                                                                            logFirebaseEvent('LoginPassword_haptic_feedback');
                                                                            HapticFeedback.selectionClick();
                                                                          },
                                                                          autofocus:
                                                                              false,
                                                                          enabled:
                                                                              true,
                                                                          textInputAction:
                                                                              TextInputAction.done,
                                                                          obscureText:
                                                                              !_model.loginPasswordVisibility,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            hintText:
                                                                                FFLocalizations.of(context).getText(
                                                                              'mvtwruzp' /* Enter Your Password */,
                                                                            ),
                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x66FFFFFF),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            filled:
                                                                                true,
                                                                            fillColor:
                                                                                Color(0x33FFFFFF),
                                                                            suffixIcon:
                                                                                InkWell(
                                                                              onTap: () async {
                                                                                safeSetState(() => _model.loginPasswordVisibility = !_model.loginPasswordVisibility);
                                                                              },
                                                                              focusNode: FocusNode(skipTraversal: true),
                                                                              child: Icon(
                                                                                _model.loginPasswordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                size: 22,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                          keyboardType:
                                                                              TextInputType.visiblePassword,
                                                                          validator: _model
                                                                              .loginPasswordTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'NEW_SIGN_IN_VERSION5_Text_k9p9ewq2_ON_TA');
                                                                      logFirebaseEvent(
                                                                          'Text_haptic_feedback');
                                                                      HapticFeedback
                                                                          .heavyImpact();
                                                                      logFirebaseEvent(
                                                                          'Text_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        ForgotPasswordCopyWidget
                                                                            .routeName,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          '__transition_info__':
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                            duration:
                                                                                Duration(milliseconds: 1),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'pdk2g4n3' /* Forgot your password? */,
                                                                      ),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0emz2ie4' /* OR CONTINUE WITH */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'NEW_SIGN_IN_VERSION5_CONTINUE_WITH_GOOGL');
                                                                      logFirebaseEvent(
                                                                          'Button_haptic_feedback');
                                                                      HapticFeedback
                                                                          .lightImpact();
                                                                      logFirebaseEvent(
                                                                          'Button_play_sound');
                                                                      _model.soundPlayer2 ??=
                                                                          AudioPlayer();
                                                                      if (_model
                                                                          .soundPlayer2!
                                                                          .playing) {
                                                                        await _model
                                                                            .soundPlayer2!
                                                                            .stop();
                                                                      }
                                                                      _model
                                                                          .soundPlayer2!
                                                                          .setVolume(
                                                                              1.0);
                                                                      _model
                                                                          .soundPlayer2!
                                                                          .setAsset(
                                                                              'assets/audios/ES_Pings,_Tings,_Generic,_High,_Tings_-_Epidemic_Sound.mp3')
                                                                          .then((_) => _model
                                                                              .soundPlayer2!
                                                                              .play());

                                                                      logFirebaseEvent(
                                                                          'Button_auth');
                                                                      GoRouter.of(
                                                                              context)
                                                                          .prepareAuthEvent();
                                                                      final user =
                                                                          await authManager
                                                                              .signInWithGoogle(context);
                                                                      if (user ==
                                                                          null) {
                                                                        return;
                                                                      }
                                                                      logFirebaseEvent(
                                                                          'Button_update_app_state');
                                                                      FFAppState()
                                                                          .isFinishedIntroWalkthrough = valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.hasSeenWalkthrough,
                                                                          false);
                                                                      safeSetState(
                                                                          () {});
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');
                                                                      FFAppState()
                                                                              .firebaseIDToken =
                                                                          currentJwtToken;
                                                                      context
                                                                          .pushNamedAuth(
                                                                        MoodScanVersion5Widget
                                                                            .routeName,
                                                                        context
                                                                            .mounted,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          '__transition_info__':
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.rightToLeft,
                                                                            duration:
                                                                                Duration(milliseconds: 1),
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'cj7rl6ao' /* Continue with Google */,
                                                                    ),
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .google,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          48.0,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      color: Color(
                                                                          0xA6E65454),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x98EDF1F7),
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  isAndroid
                                                                      ? Container()
                                                                      : FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('NEW_SIGN_IN_VERSION5_CONTINUE_WITH_APPLE');
                                                                            var _shouldSetState =
                                                                                false;
                                                                            logFirebaseEvent('Button_haptic_feedback');
                                                                            HapticFeedback.lightImpact();
                                                                            logFirebaseEvent('Button_play_sound');
                                                                            _model.soundPlayer3 ??=
                                                                                AudioPlayer();
                                                                            if (_model.soundPlayer3!.playing) {
                                                                              await _model.soundPlayer3!.stop();
                                                                            }
                                                                            _model.soundPlayer3!.setVolume(1.0);
                                                                            _model.soundPlayer3!.setAsset('assets/audios/ES_Pings,_Tings,_Generic,_High,_Tings_-_Epidemic_Sound.mp3').then((_) =>
                                                                                _model.soundPlayer3!.play());

                                                                            logFirebaseEvent('Button_auth');
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            final user =
                                                                                await authManager.signInWithApple(context);
                                                                            if (user ==
                                                                                null) {
                                                                              return;
                                                                            }
                                                                            logFirebaseEvent('Button_update_app_state');
                                                                            FFAppState().isFinishedIntroWalkthrough =
                                                                                valueOrDefault<bool>(currentUserDocument?.hasSeenWalkthrough, false);
                                                                            safeSetState(() {});
                                                                            if (FFAppState().chatSessionId ==
                                                                                '') {
                                                                              logFirebaseEvent('Button_backend_call');
                                                                              _model.createIDForLogin = await TheoryOfMindSessionManagementGroup.createIDCall.call();

                                                                              _shouldSetState = true;
                                                                              logFirebaseEvent('Button_backend_call');
                                                                              _model.validateSession = await TheoryOfMindSessionManagementGroup.validateSessionCall.call(
                                                                                userID: currentUserUid,
                                                                              );

                                                                              _shouldSetState = true;
                                                                              if (!(_model.validateSession?.succeeded ?? true)) {
                                                                                logFirebaseEvent('Button_show_snack_bar');
                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                  SnackBar(
                                                                                    content: Text(
                                                                                      'Lucille has checked our records and you will need to create and account in order to continue. Please Swipe Right.',
                                                                                      style: TextStyle(
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                    ),
                                                                                    duration: Duration(milliseconds: 4000),
                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                  ),
                                                                                );
                                                                                if (_shouldSetState) safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            }
                                                                            logFirebaseEvent('Button_navigate_to');
                                                                            FFAppState().firebaseIDToken =
                                                                                currentJwtToken;

                                                                            context.pushNamedAuth(
                                                                              MoodScanVersion5Widget.routeName,
                                                                              context.mounted,
                                                                              extra: <String, dynamic>{
                                                                                '__transition_info__': TransitionInfo(
                                                                                  hasTransition: true,
                                                                                  transitionType: PageTransitionType.rightToLeft,
                                                                                  duration: Duration(milliseconds: 1),
                                                                                ),
                                                                              },
                                                                            );

                                                                            if (_shouldSetState)
                                                                              safeSetState(() {});
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '0gbg5dh5' /* Continue with Apple */,
                                                                          ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.apple,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                48.0,
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                Color(0xB71C2444),
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x98EDF1F7),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'df1ucsxy' /* Don't have an account? */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                      InkWell(
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
                                                              'NEW_SIGN_IN_VERSION5_Text_z16v01xq_ON_TA');
                                                          logFirebaseEvent(
                                                              'Text_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'Text_play_sound');
                                                          _model.soundPlayer4 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer4!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer4!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer4!
                                                              .setVolume(1.0);
                                                          _model.soundPlayer4!
                                                              .setAsset(
                                                                  'assets/audios/ES_Sci_Fi_Games,_UI_Menu,_Very_Short,_Open_10_-_Epidemic_Sound.mp3')
                                                              .then((_) => _model
                                                                  .soundPlayer4!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'Text_page_view');
                                                          await _model
                                                              .pageViewController
                                                              ?.nextPage(
                                                            duration: Duration(
                                                                milliseconds:
                                                                    300),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '6bv6s5l6' /* Create your cosmic identity */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                            font: GoogleFonts
                                                                .cormorantSc(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                            shadows: [
                                                              Shadow(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                offset: Offset(
                                                                    8.0, 8.0),
                                                                blurRadius: 8.0,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.7,
                                                      height: 56.9,
                                                      decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 40.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                            spreadRadius: 20.0,
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                      ),
                                                      child:
                                                          RadialPixelDissolveShaderWrap(
                                                        params: ShaderParams(
                                                            values: {
                                                              'centerX': 0.5,
                                                              'centerY': 0.5,
                                                              'scale': 1.0,
                                                              'pixelSize': 5.11,
                                                              'edgeWidth': 0.35,
                                                              'scatter': 0.36,
                                                              'noiseAmount':
                                                                  0.93,
                                                              'speed': 0.53
                                                            }),
                                                        animationMode:
                                                            ShaderAnimationMode
                                                                .explicit,
                                                        animationConfig:
                                                            ShaderAnimationConfig(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        (2000.0)
                                                                            .round()),
                                                                curve: Curves
                                                                    .easeIn,
                                                                invert: true),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'NEW_SIGN_IN_VERSION5_CONTINUE_MY_JOURNEY');
                                                            logFirebaseEvent(
                                                                'Button_haptic_feedback');
                                                            HapticFeedback
                                                                .heavyImpact();
                                                            logFirebaseEvent(
                                                                'Button_validate_form');
                                                            _model.validateLogin23 =
                                                                true;
                                                            if (_model.formKey2
                                                                        .currentState ==
                                                                    null ||
                                                                !_model.formKey2
                                                                    .currentState!
                                                                    .validate()) {
                                                              _model.validateLogin23 =
                                                                  false;
                                                            }
                                                            logFirebaseEvent(
                                                                'Button_auth');
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();

                                                            final user =
                                                                await authManager
                                                                    .signInWithEmail(
                                                              context,
                                                              _model
                                                                  .loginEmailTextController
                                                                  .text,
                                                              _model
                                                                  .loginPasswordTextController
                                                                  .text,
                                                            );
                                                            if (user == null) {
                                                              return;
                                                            }

                                                            logFirebaseEvent(
                                                                'Button_update_app_state');
                                                            FFAppState()
                                                                    .isFinishedIntroWalkthrough =
                                                                valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.hasSeenWalkthrough,
                                                                    false);
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'Button_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .clearSnackBars();
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Login Successful!',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            logFirebaseEvent(
                                                                'Button_play_sound');
                                                            _model.soundPlayer5 ??=
                                                                AudioPlayer();
                                                            if (_model
                                                                .soundPlayer5!
                                                                .playing) {
                                                              await _model
                                                                  .soundPlayer5!
                                                                  .stop();
                                                            }
                                                            _model.soundPlayer5!
                                                                .setVolume(1.0);
                                                            _model.soundPlayer5!
                                                                .setAsset(
                                                                    'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                                .then((_) => _model
                                                                    .soundPlayer5!
                                                                    .play());

                                                            logFirebaseEvent(
                                                                'Button_navigate_to');
                                                            FFAppState()
                                                                    .firebaseIDToken =
                                                                currentJwtToken;

                                                            context
                                                                .pushNamedAuth(
                                                              MoodScanVersion5Widget
                                                                  .routeName,
                                                              context.mounted,
                                                              extra: <String,
                                                                  dynamic>{
                                                                '__transition_info__':
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          9),
                                                                ),
                                                              },
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'a7wtorqo' /* Continue My Journey */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 269.1,
                                                            height: 56.0,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: Color(
                                                                0xFFFF6B35),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                            elevation: 4.0,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28.0),
                                                            hoverColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            hoverTextColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
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
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1).gif',
                                    ).image,
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF6B5B95),
                                      Color(0xFF4A90E2)
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
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
                                      width: 100.0,
                                      height: 128.8,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0x26EDF1F7),
                                            Color(0x3C39519F),
                                            Color(0x78673AB7)
                                          ],
                                          stops: [0.0, 0.5, 1.0],
                                          begin:
                                              AlignmentDirectional(1.0, -0.64),
                                          end: AlignmentDirectional(-1.0, 0.64),
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 80.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                AnimatedShaderParams(
                                                    params:
                                                        ShaderParams(values: {
                                                      'angle': 90.0,
                                                      'scale': 1.0,
                                                      'offset': 0.0,
                                                      'noiseScale': 6.0,
                                                      'edgeWidth': 0.25,
                                                      'glowIntensity': 2.5,
                                                      'speed': 0.2
                                                    }, colors: {
                                                      'smokeColor':
                                                          Color(0xFFC8C8D2)
                                                    }),
                                                    duration: Duration(
                                                        milliseconds:
                                                            (500.0).round()),
                                                    curve: Curves.easeOut,
                                                    builder: (params,
                                                            backgroundColor) =>
                                                        SmokeShaderWrap(
                                                          params: params,
                                                          animationMode:
                                                              ShaderAnimationMode
                                                                  .explicit,
                                                          animationConfig: ShaderAnimationConfig(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      (2000.0)
                                                                          .round()),
                                                              curve:
                                                                  Curves.easeIn,
                                                              invert: true),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/Logo_ESCAPE_Black.png',
                                                              width: 200.0,
                                                              height: 75.2,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          ),
                                                        )),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dupalt31' /* Every journey begins with a ch... */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 8.0)),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Form(
                                              key: _model.formKey1,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .displayNameTextController,
                                                      focusNode: _model
                                                          .displayNameFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.displayNameTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'NEW_SIGN_IN_VERSION5_DisplayName_ON_TEXT');
                                                        logFirebaseEvent(
                                                            'DisplayName_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                      },
                                                      autofocus: false,
                                                      enabled: true,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'y80ib0bv' /* Name */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x31D0E3F7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        hoverColor:
                                                            Color(0x44EDF1F7),
                                                        suffixIcon: _model
                                                                .displayNameTextController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .displayNameTextController
                                                                      ?.clear();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xEEEDF1F7),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      validator: _model
                                                          .displayNameTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .createEmailTextController,
                                                      focusNode: _model
                                                          .createEmailFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.createEmailTextController',
                                                        Duration(
                                                            milliseconds: 2000),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'NEW_SIGN_IN_VERSION5_CreateEmail_ON_TEXT');
                                                        logFirebaseEvent(
                                                            'CreateEmail_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                      },
                                                      autofocus: false,
                                                      enabled: true,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'y6i199pj' /* Enter your email */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x31D0E3F7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        hoverColor:
                                                            Color(0x44EDF1F7),
                                                        suffixIcon: _model
                                                                .createEmailTextController!
                                                                .text
                                                                .isNotEmpty
                                                            ? InkWell(
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .createEmailTextController
                                                                      ?.clear();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.clear,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  size: 22.0,
                                                                ),
                                                              )
                                                            : null,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xEEEDF1F7),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      validator: _model
                                                          .createEmailTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .createPasswordTextController,
                                                      focusNode: _model
                                                          .createPasswordFocusNode,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'NEW_SIGN_IN_VERSION5_CreatePassword_ON_T');
                                                        logFirebaseEvent(
                                                            'CreatePassword_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                      },
                                                      autofocus: false,
                                                      enabled: true,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: !_model
                                                          .createPasswordVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'xjsbnu6r' /* Create a password */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x31D0E3F7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        hoverColor:
                                                            Color(0x44EDF1F7),
                                                        suffixIcon: InkWell(
                                                          onTap: () async {
                                                            safeSetState(() => _model
                                                                    .createPasswordVisibility =
                                                                !_model
                                                                    .createPasswordVisibility);
                                                          },
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.createPasswordVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 22.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xEEEDF1F7),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      validator: _model
                                                          .createPasswordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 300.0,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .confirmPasswordTextController,
                                                      focusNode: _model
                                                          .confirmPasswordFocusNode,
                                                      onFieldSubmitted:
                                                          (_) async {
                                                        logFirebaseEvent(
                                                            'NEW_SIGN_IN_VERSION5_ConfirmPassword_ON_');
                                                        logFirebaseEvent(
                                                            'ConfirmPassword_haptic_feedback');
                                                        HapticFeedback
                                                            .lightImpact();
                                                      },
                                                      autofocus: false,
                                                      enabled: true,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: !_model
                                                          .confirmPasswordVisibility,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'jm1lxjlu' /* Confirm your password */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            InputBorder.none,
                                                        focusedBorder:
                                                            InputBorder.none,
                                                        errorBorder:
                                                            InputBorder.none,
                                                        focusedErrorBorder:
                                                            InputBorder.none,
                                                        filled: true,
                                                        fillColor:
                                                            Color(0x31D0E3F7),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    16.0,
                                                                    16.0,
                                                                    16.0),
                                                        hoverColor:
                                                            Color(0x44EDF1F7),
                                                        suffixIcon: InkWell(
                                                          onTap: () async {
                                                            safeSetState(() => _model
                                                                    .confirmPasswordVisibility =
                                                                !_model
                                                                    .confirmPasswordVisibility);
                                                          },
                                                          focusNode: FocusNode(
                                                              skipTraversal:
                                                                  true),
                                                          child: Icon(
                                                            _model.confirmPasswordVisibility
                                                                ? Icons
                                                                    .visibility_outlined
                                                                : Icons
                                                                    .visibility_off_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 22.0,
                                                          ),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: Color(
                                                                    0xEEEDF1F7),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      validator: _model
                                                          .confirmPasswordTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qijyx8bk' /* Which energy resonates with yo... */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'bg2ttxkr' /* Grounding */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wgq6tz2b' /* Creator */,
                                                                ))
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.lowerChakraMoodsValue =
                                                                        val?.firstOrNull);
                                                                logFirebaseEvent(
                                                                    'NEW_SIGN_IN_VERSION5_LowerChakraMoods_ON');
                                                                logFirebaseEvent(
                                                                    'LowerChakraMoods_haptic_feedback');
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                              },
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0x848B4513),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xB6FF8C00),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              chipSpacing: 15.0,
                                                              rowSpacing: 20.0,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceEvenly,
                                                              controller: _model
                                                                      .lowerChakraMoodsValueController ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'wzdcld6o' /* Warrior */,
                                                                )),
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'kz20m7ig' /* Healer */,
                                                                ))
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.middleChakraMoodsValue =
                                                                        val?.firstOrNull);
                                                                logFirebaseEvent(
                                                                    'NEW_SIGN_IN_VERSION5_MiddleChakraMoods_O');
                                                                logFirebaseEvent(
                                                                    'MiddleChakraMoods_haptic_feedback');
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                              },
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0xA5DAA520),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0x8C228B22),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              chipSpacing: 25.0,
                                                              rowSpacing: 8.0,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .spaceEvenly,
                                                              controller: _model
                                                                      .middleChakraMoodsValueController ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                '98ws6791' /* Speaker */,
                                                              )),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'zo8k03ne' /* Intuition */,
                                                              ))
                                                            ],
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(() =>
                                                                  _model.higherChakraMoodsValue =
                                                                      val?.firstOrNull);
                                                              logFirebaseEvent(
                                                                  'NEW_SIGN_IN_VERSION5_HigherChakraMoods_O');
                                                              logFirebaseEvent(
                                                                  'HigherChakraMoods_haptic_feedback');
                                                              HapticFeedback
                                                                  .mediumImpact();
                                                            },
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xA61E90FF),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFA400BD),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              iconSize: 16.0,
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 25.0,
                                                            rowSpacing: 8.0,
                                                            multiselect: false,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceEvenly,
                                                            controller: _model
                                                                    .higherChakraMoodsValueController ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 12.0)),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FlutterFlowChoiceChips(
                                                              options: [
                                                                ChipData(FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'jtbbig6p' /* Ascended */,
                                                                ))
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                safeSetState(() =>
                                                                    _model.crownChakraMoodsValue =
                                                                        val?.firstOrNull);
                                                                logFirebaseEvent(
                                                                    'NEW_SIGN_IN_VERSION5_CrownChakraMoods_ON');
                                                                logFirebaseEvent(
                                                                    'CrownChakraMoods_haptic_feedback');
                                                                HapticFeedback
                                                                    .mediumImpact();
                                                              },
                                                              selectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0x717171F0),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              unselectedChipStyle:
                                                                  ChipStyle(
                                                                backgroundColor:
                                                                    Color(
                                                                        0x717171F0),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                iconColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                iconSize: 16.0,
                                                                elevation: 0.0,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              chipSpacing: 8.0,
                                                              rowSpacing: 8.0,
                                                              multiselect:
                                                                  false,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              controller: _model
                                                                      .crownChakraMoodsValueController ??=
                                                                  FormFieldController<
                                                                      List<
                                                                          String>>(
                                                                [],
                                                              ),
                                                              wrapped: true,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                          Container(
                                            width: 257.7,
                                            height: 53.39,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 40.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                  spreadRadius: 20.0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: AnimatedShaderParams(
                                                params: ShaderParams(values: {
                                                  'scale': 1.0,
                                                  'edgeWidth': 0.35,
                                                  'angle': 70.0,
                                                  'offset': 0.46,
                                                  'pixelSize': 3.81,
                                                  'scatter': 2.04,
                                                  'noiseAmount': 0.41,
                                                  'speed': 0.3
                                                }),
                                                duration: Duration(
                                                    milliseconds:
                                                        (500.0).round()),
                                                curve: Curves.easeOut,
                                                builder: (params,
                                                        backgroundColor) =>
                                                    PixelDissolveShaderWrap(
                                                      params: params,
                                                      animationMode:
                                                          ShaderAnimationMode
                                                              .explicit,
                                                      animationConfig:
                                                          ShaderAnimationConfig(
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      (2000.0)
                                                                          .round()),
                                                              curve:
                                                                  Curves.easeIn,
                                                              invert: true),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'NEW_SIGN_IN_VERSION5_BEGIN_MY_JOURNEY_BT');
                                                          logFirebaseEvent(
                                                              'Button_haptic_feedback');
                                                          HapticFeedback
                                                              .heavyImpact();
                                                          logFirebaseEvent(
                                                              'Button_validate_form');
                                                          _model.createAccountValidation =
                                                              true;
                                                          if (_model.formKey1
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey1
                                                                  .currentState!
                                                                  .validate()) {
                                                            _model.createAccountValidation =
                                                                false;
                                                          }
                                                          logFirebaseEvent(
                                                              'Button_auth');
                                                          GoRouter.of(context)
                                                              .prepareAuthEvent();
                                                          if (_model
                                                                  .createPasswordTextController
                                                                  .text !=
                                                              _model
                                                                  .confirmPasswordTextController
                                                                  .text) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'eni3v0ol' /* Passwords do not match. Try ag... */,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                            return;
                                                          }

                                                          final user =
                                                              await authManager
                                                                  .createAccountWithEmail(
                                                            context,
                                                            _model
                                                                .createEmailTextController
                                                                .text,
                                                            _model
                                                                .createPasswordTextController
                                                                .text,
                                                          );
                                                          if (user == null) {
                                                            return;
                                                          }

                                                          await UsersRecord
                                                              .collection
                                                              .doc(user.uid)
                                                              .set(
                                                                  createUsersRecordData(
                                                                email: _model
                                                                    .createEmailTextController
                                                                    .text,
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                displayName: _model
                                                                    .displayNameTextController
                                                                    .text,
                                                                uid: user.uid,
                                                              ));

                                                          logFirebaseEvent(
                                                              'Button_play_sound');
                                                          _model.soundPlayer6 ??=
                                                              AudioPlayer();
                                                          if (_model
                                                              .soundPlayer6!
                                                              .playing) {
                                                            await _model
                                                                .soundPlayer6!
                                                                .stop();
                                                          }
                                                          _model.soundPlayer6!
                                                              .setVolume(1.0);
                                                          await _model
                                                              .soundPlayer6!
                                                              .setAsset(
                                                                  'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_3038-4627.wav')
                                                              .then((_) => _model
                                                                  .soundPlayer6!
                                                                  .play());

                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await currentUserReference!
                                                              .update(
                                                                  createUsersRecordData(
                                                            lowerChakraMood: _model
                                                                .lowerChakraMoodsValue,
                                                            middleChakraMood: _model
                                                                .middleChakraMoodsValue,
                                                            higherChakraMood: _model
                                                                .higherChakraMoodsValue,
                                                            ascendedMood: _model
                                                                .crownChakraMoodsValue,
                                                            hasSeenWalkthrough:
                                                                false,
                                                          ));
                                                          logFirebaseEvent(
                                                              'Button_show_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Account Created!',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                            ),
                                                          );
                                                          logFirebaseEvent(
                                                              'Button_hide_snack_bar');
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          logFirebaseEvent(
                                                              'Button_navigate_to');
                                                          FFAppState()
                                                                  .firebaseIDToken =
                                                              currentJwtToken;

                                                          context.pushNamedAuth(
                                                            CreateAccountOnboardingFlowWidget
                                                                .routeName,
                                                            context.mounted,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2),
                                                              ),
                                                            },
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'acnpc4a1' /* Begin My Journey! */,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 300.0,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFF97316),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .cormorantSc(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x5CEDF1F7),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          hoverColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          hoverBorderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x38EDF1F7),
                                                          ),
                                                          hoverTextColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          hoverElevation: 2.0,
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '040pxtfz' /* Already have an account? */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0x98D0E3F7),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'NEW_SIGN_IN_VERSION5_Text_dotzx0s7_ON_TA');
                                                  logFirebaseEvent(
                                                      'Text_haptic_feedback');
                                                  HapticFeedback.lightImpact();
                                                  logFirebaseEvent(
                                                      'Text_play_sound');
                                                  _model.soundPlayer7 ??=
                                                      AudioPlayer();
                                                  if (_model
                                                      .soundPlayer7!.playing) {
                                                    await _model.soundPlayer7!
                                                        .stop();
                                                  }
                                                  _model.soundPlayer7!
                                                      .setVolume(1.0);
                                                  _model.soundPlayer7!
                                                      .setAsset(
                                                          'assets/audios/ES_Pops,_Wobble,_Bloop,_Pops_-_Epidemic_Sound.mp3')
                                                      .then((_) => _model
                                                          .soundPlayer7!
                                                          .play());

                                                  logFirebaseEvent(
                                                      'Text_page_view');
                                                  await _model
                                                      .pageViewController
                                                      ?.previousPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '1ryjw59e' /* Log In */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                          ].divide(SizedBox(height: 24.0)),
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
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 2,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0,
                            radius: 8.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            dotColor: FlutterFlowTheme.of(context).secondary,
                            activeDotColor:
                                FlutterFlowTheme.of(context).accent1,
                            paintStyle: PaintingStyle.fill,
                          ),
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
  }
}
