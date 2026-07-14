import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/app_events/index.dart';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'mood_scan_version5_model.dart';
export 'mood_scan_version5_model.dart';

class MoodScanVersion5Widget extends StatefulWidget {
  const MoodScanVersion5Widget({super.key});

  static String routeName = 'MoodScanVersion5';
  static String routePath = '/moodScanVersion5';

  @override
  State<MoodScanVersion5Widget> createState() => _MoodScanVersion5WidgetState();
}

class _MoodScanVersion5WidgetState extends State<MoodScanVersion5Widget>
    with TickerProviderStateMixin {
  late MoodScanVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodScanVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodScanVersion5'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1360.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1080.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 1840.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/544539643a2b1ae28b6cabe578ae19ce.gif',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30.0,
                      sigmaY: 30.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x58EDF1F7),
                            Color(0x8FD0E3F7),
                            Color(0x75673AB7)
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(1.0, -0.64),
                          end: AlignmentDirectional(-1.0, 0.64),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 80.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'ehla34dm' /* Step 1 of 2 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                                                  color: Color(0xCCFFFFFF),
                                                  fontSize: 16.0,
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
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'yk1zuchp' /* Scan Your Mood */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  font: GoogleFonts.cormorantSc(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .displaySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'acm41l4y' /* Everyday that we experience Es... */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
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
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 90.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 247.2,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 80.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                              spreadRadius: 5.0,
                                            )
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25.0),
                                            bottomRight: Radius.circular(25.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Lottie.asset(
                                            'assets/jsons/Face_scan.json',
                                            width: 200.0,
                                            height: 200.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!),
                                    ),
                                    if (_model.isScanLoading == true)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                            SizedBox(height: 16.0),
                                            Text(
                                              'Lucille is reading your energy...',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (_model.isScanLoading == false)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 550),
                                          curve: Curves.easeIn,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.8,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 150.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 40.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                      spreadRadius: 4.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MOOD_SCAN_VERSION5_GO_HOME_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .lightImpact();
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        HomeVersion5Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'i4dfofhv' /* Go Home */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x4CEDF1F7),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 150.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 40.0,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        FFAppState()
                                                                .isOnboardingFinished
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                      ),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                      spreadRadius: 4.0,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MOOD_SCAN_VERSION5_SCAN_MOOD_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.isScanLoading =
                                                          true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_upload_media_to_firebase');
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        allowPhoto: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading_mdPhoto =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          showUploadMessage(
                                                            context,
                                                            'Uploading file...',
                                                            showLoading: true,
                                                          );
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                        originalFilename:
                                                                            m.originalFilename,
                                                                      ))
                                                                  .toList();

                                                          downloadUrls =
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .hideCurrentSnackBar();
                                                          _model.isDataUploading_mdPhoto =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                    .length ==
                                                                selectedMedia
                                                                    .length &&
                                                            downloadUrls
                                                                    .length ==
                                                                selectedMedia
                                                                    .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile_mdPhoto =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl_mdPhoto =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                          showUploadMessage(
                                                              context,
                                                              'Success!');
                                                        } else {
                                                          safeSetState(() {});
                                                          showUploadMessage(
                                                              context,
                                                              'Failed to upload data');
                                                          _model.isScanLoading =
                                                              false;
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      // Guard: user cancelled photo selection
                                                      if (_model.uploadedFileUrl_mdPhoto ==
                                                              null ||
                                                          _model
                                                              .uploadedFileUrl_mdPhoto!
                                                              .isEmpty) {
                                                        _model.isScanLoading =
                                                            false;
                                                        safeSetState(() {});
                                                        return;
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Mood photo has been saved! Lucille is reading your energy...',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                      .primary,
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
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                        ),
                                                      );
                                                      logFirebaseEvent(
                                                          'Button_hide_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .hideCurrentSnackBar();
                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      debugPrint(
                                                          'uploadedFileUrl_mdPhoto: \${_model.uploadedFileUrl_mdPhoto}');
                                                      String moodResultText =
                                                          'Neutral';
                                                      double stressLevelValue =
                                                          0.5;
                                                      String energyLevelText =
                                                          'Neutral';

                                                      try {
                                                        final imageResponse =
                                                            await http.get(
                                                          Uri.parse(_model
                                                              .uploadedFileUrl_mdPhoto!),
                                                        );
                                                        final request = http
                                                            .MultipartRequest(
                                                          'POST',
                                                          Uri.parse(
                                                              'https://lucillellm2-286076426888.us-east4.run.app/facial-emotion/detect'),
                                                        );
                                                        request.headers[
                                                                'Authorization'] =
                                                            'Bearer $currentJwtToken';
                                                        request.files.add(
                                                          http.MultipartFile
                                                              .fromBytes(
                                                            'file',
                                                            imageResponse
                                                                .bodyBytes,
                                                            filename:
                                                                'mood_photo.jpg',
                                                          ),
                                                        );

                                                        final streamedResponse =
                                                            await request
                                                                .send();
                                                        final responseBody =
                                                            await streamedResponse
                                                                .stream
                                                                .bytesToString();
                                                        debugPrint(
                                                            'facial-emotion response: $responseBody');

                                                        final decoded =
                                                            jsonDecode(
                                                                responseBody);
                                                        if (decoded['status'] ==
                                                                'success' &&
                                                            decoded['results'] !=
                                                                null &&
                                                            (decoded['results']
                                                                    as List)
                                                                .isNotEmpty) {
                                                          final firstFace =
                                                              decoded['results']
                                                                  [0];
                                                          final predictedEmotion =
                                                              (firstFace['predicted_emotion'] ??
                                                                      'neutral')
                                                                  .toString();
                                                          final probabilities =
                                                              firstFace['probabilities']
                                                                      as Map<
                                                                          String,
                                                                          dynamic>? ??
                                                                  {};

                                                          moodResultText =
                                                              predictedEmotion[
                                                                          0]
                                                                      .toUpperCase() +
                                                                  predictedEmotion
                                                                      .substring(
                                                                          1);
                                                          energyLevelText =
                                                              moodResultText;

                                                          final fear =
                                                              (probabilities[
                                                                          'fear'] ??
                                                                      0.0)
                                                                  as num;
                                                          final angry =
                                                              (probabilities[
                                                                          'angry'] ??
                                                                      0.0)
                                                                  as num;
                                                          final sad =
                                                              (probabilities[
                                                                          'sad'] ??
                                                                      0.0)
                                                                  as num;
                                                          stressLevelValue =
                                                              (fear.toDouble() +
                                                                      angry.toDouble() +
                                                                      sad.toDouble())
                                                                  .clamp(0.0,
                                                                      1.0);
                                                        }
                                                      } catch (e) {
                                                        debugPrint(
                                                            'facial-emotion detect error: $e');
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_trigger_app_event');
                                                      FFAppEventService.instance
                                                          .triggerAppEvent(
                                                        AiThinkingEvent(
                                                          timestamp:
                                                              DateTime.now(),
                                                          waitForCompletion:
                                                              true,
                                                          debugId: '7',
                                                        ),
                                                      );

                                                      logFirebaseEvent(
                                                          'Button_backend_call');
                                                      try {
                                                        await currentUserReference!
                                                            .set(
                                                                createUsersRecordData(
                                                                  currentMood:
                                                                      moodResultText,
                                                                  timeStamp:
                                                                      getCurrentTimestamp,
                                                                  createdTime:
                                                                      getCurrentTimestamp,
                                                                  uid:
                                                                      currentUserUid,
                                                                ),
                                                                SetOptions(
                                                                    merge:
                                                                        true));
                                                      } catch (e) {
                                                        debugPrint(
                                                            'Firestore update skipped: $e');
                                                      }
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');
                                                      FFAppState().moodPhoto =
                                                          _model
                                                              .uploadedFileUrl_mdPhoto;
                                                      FFAppState().moods =
                                                          moodResultText;
                                                      FFAppState()
                                                          .update(() {});
                                                      logFirebaseEvent(
                                                          'Button_trigger_app_event');
                                                      FFAppEventService.instance
                                                          .triggerAppEvent(
                                                        MoodScannedEvent(
                                                          data:
                                                              AiResponseStruct(
                                                            message:
                                                                moodResultText,
                                                            type: 'Mood',
                                                          ),
                                                          timestamp:
                                                              DateTime.now(),
                                                          waitForCompletion:
                                                              false,
                                                          debugId: '2',
                                                        ),
                                                      );

                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.isScanLoading =
                                                          false;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Button_navigate_to');

                                                      context.pushNamed(
                                                        MoodResultTransitionWidget
                                                            .routeName,
                                                        queryParameters: {
                                                          'moodResult':
                                                              serializeParam(
                                                            moodResultText,
                                                            ParamType.String,
                                                          ),
                                                          'stressLevel':
                                                              serializeParam(
                                                            stressLevelValue,
                                                            ParamType.double,
                                                          ),
                                                          'energyLevel':
                                                              serializeParam(
                                                            energyLevelText,
                                                            ParamType.String,
                                                          ),
                                                          'moodPhoto':
                                                              serializeParam(
                                                            _model
                                                                .uploadedFileUrl_mdPhoto,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .rightToLeft,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2),
                                                          ),
                                                        },
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '7ofblemc' /* Scan Mood */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xD7F0831A),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
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
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x4CEDF1F7),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    showLoadingIndicator:
                                                        _model.isScanLoading ==
                                                            true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 32.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
            ],
          ),
        ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!),
      ),
    );
  }
}