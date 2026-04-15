import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import '/flutter_flow/permissions_util.dart';
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
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'create_account_onboarding_flow_model.dart';
export 'create_account_onboarding_flow_model.dart';

class CreateAccountOnboardingFlowWidget extends StatefulWidget {
  const CreateAccountOnboardingFlowWidget({super.key});

  static String routeName = 'CreateAccountOnboardingFlow';
  static String routePath = 'createAccountOnboardingFlow';

  @override
  State<CreateAccountOnboardingFlowWidget> createState() =>
      _CreateAccountOnboardingFlowWidgetState();
}

class _CreateAccountOnboardingFlowWidgetState
    extends State<CreateAccountOnboardingFlowWidget>
    with TickerProviderStateMixin {
  late CreateAccountOnboardingFlowModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    debugPrint('>>> CreateAccountOnboardingFlow initState called');
    _model = createModel(context, () => CreateAccountOnboardingFlowModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CreateAccountOnboardingFlow'});

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.soundPlayer1 ??= AudioPlayer();
      if (_model.soundPlayer1!.playing) {
        await _model.soundPlayer1!.stop();
      }
      _model.soundPlayer1!.setVolume(1.0);
      _model.soundPlayer1!
          .setAsset(
              'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_0000-1106.wav')
          .then((_) => _model.soundPlayer1!.play());
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
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
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 730.0.ms,
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
    debugPrint('>>> CreateAccountOnboardingFlow disposed');
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('>>> CreateAccountOnboardingFlow build called');
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
        body: Stack(
          children: [
            // ─── Background GIF ───────────────────────────────
            Positioned.fill(
              child: Image.asset(
                'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                fit: BoxFit.cover,
              ),
            ),
            // ─── Gradient overlay ─────────────────────────────
            Positioned.fill(
              child: Container(
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
              ),
            ),
            // ─── Content Layer ────────────────────────────────
            SafeArea(
              child: Stack(
                children: [
                  PageView(
                    controller: _model.pageViewController ??=
                        PageController(initialPage: 0),
                    onPageChanged: (_) async {
                      FFAppState().onboardingTabIndex =
                          _model.pageViewCurrentIndex;
                      FFAppState().isOnboardingFinished =
                          _model.pageViewCurrentIndex > 2 ? true : false;
                      safeSetState(() {});
                      _model.soundPlayer2 ??= AudioPlayer();
                      if (_model.soundPlayer2!.playing) {
                        await _model.soundPlayer2!.stop();
                      }
                      _model.soundPlayer2!.setVolume(0.38);
                      _model.soundPlayer2!
                          .setAsset(
                              'assets/audios/ES_Notification,_Attention,_Short_Phrase,_Positive_Achievement,_Win,_Video_Game_01_-_Epidemic_Sound.mp3')
                          .then((_) => _model.soundPlayer2!.play());
                    },
                    scrollDirection: Axis.horizontal,
                    children: [
                      // ─── PAGE 1: Create Identity ─────────────
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 80.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                            'upu7xls9' /* Step 1 of 4 */),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color: Color(0xCCFFFFFF),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                            'ixpkur6f' /* Create Your Identity */),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'The Seasons',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                          'hna0gihv' /* How would you like to be known... */),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: Color(0xDA39519F),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    // Profile picture
                                    Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.07, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              curve: Curves.easeIn,
                                              width: 120.0,
                                              height: 120.0,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 40.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    offset: Offset(0.0, 2.0),
                                                    spreadRadius: 3.0,
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Color(0x50EDF1F7)),
                                              ),
                                              child: _model
                                                      .profilePicture.isNotEmpty
                                                  ? Hero(
                                                      tag:
                                                          _model.profilePicture,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(99.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: _model
                                                              .profilePicture,
                                                          width: 200.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                          errorWidget: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.jpg',
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              99.0),
                                                      child: Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        width: 120.0,
                                                        height: 120.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.25, 1.03),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 90.0, 0.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: const CircleBorder(),
                                              child: Container(
                                                width: 49.47,
                                                height: 49.47,
                                                decoration: BoxDecoration(
                                                  color: Color(0x46EDF1F7),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Color(0x6BD0E3F7)),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Color(0xA8D0E3F7),
                                                  borderRadius: 99.0,
                                                  buttonSize: 53.39,
                                                  fillColor: Color(0x79FCC462),
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    size: 28.0,
                                                  ),
                                                  onPressed: () async {
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await requestPermission(
                                                        photoLibraryPermission);
                                                    await requestPermission(
                                                        cameraPermission);
                                                    final selectedMedia =
                                                        await selectMediaWithSourceBottomSheet(
                                                      context: context,
                                                      allowPhoto: true,
                                                    );
                                                    if (selectedMedia != null &&
                                                        selectedMedia.every((m) =>
                                                            validateFileFormat(
                                                                m.storagePath,
                                                                context))) {
                                                      safeSetState(() => _model
                                                              .isDataUploading_profilePictureUpload1 =
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
                                                                          .split(
                                                                              '/')
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
                                                            (await Future.wait(
                                                          selectedMedia.map(
                                                            (m) async =>
                                                                await uploadData(
                                                                    m.storagePath,
                                                                    m.bytes),
                                                          ),
                                                        ))
                                                                .where((u) =>
                                                                    u != null)
                                                                .map((u) => u!)
                                                                .toList();
                                                      } finally {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .hideCurrentSnackBar();
                                                        _model.isDataUploading_profilePictureUpload1 =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                                  .length ==
                                                              selectedMedia
                                                                  .length &&
                                                          downloadUrls.length ==
                                                              selectedMedia
                                                                  .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile_profilePictureUpload1 =
                                                              selectedUploadedFiles
                                                                  .first;
                                                          _model.uploadedFileUrl_profilePictureUpload1 =
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
                                                        return;
                                                      }
                                                    }
                                                    _model.profilePicture = _model
                                                        .uploadedFileUrl_profilePictureUpload1;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .ProfilePicture =
                                                        _model.profilePicture;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Display Name
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context)
                                              .getText('2mx3h16t'),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color: Color(0xCCFFFFFF),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText('hwiia2pi'),
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      fontSize: 14.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            filled: true,
                                            fillColor: Color(0x99FFFFFF),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 16.0, 20.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                    // Pronouns
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context)
                                              .getText('j0g3owto'),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color: Color(0xCCFFFFFF),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x99FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .dropDownValueController ??=
                                                FormListFieldController<String>(
                                                    _model.dropDownValue ??=
                                                        List<String>.from(
                                              Pronouns.values
                                                      .map((e) => e.name)
                                                      .toList() ??
                                                  [],
                                            )),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText('iwebfo82'),
                                              FFLocalizations.of(context)
                                                  .getText('vqed5mio'),
                                              FFLocalizations.of(context)
                                                  .getText('iuo582xt'),
                                              FFLocalizations.of(context)
                                                  .getText('tkr3ymh3'),
                                              FFLocalizations.of(context)
                                                  .getText('njwpjgdp'),
                                              FFLocalizations.of(context)
                                                  .getText('w3edevhg'),
                                              FFLocalizations.of(context)
                                                  .getText('tfvcmzxt'),
                                              FFLocalizations.of(context)
                                                  .getText('aomfrr4k'),
                                              FFLocalizations.of(context)
                                                  .getText('19330qx3'),
                                              FFLocalizations.of(context)
                                                  .getText('lxsdyexe'),
                                              FFLocalizations.of(context)
                                                  .getText('z17izint'),
                                            ],
                                            width: 200.0,
                                            height: 40.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText('fq01bjqh'),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue = val);
                                              HapticFeedback.lightImpact();
                                            },
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 8.0)),
                                    ),
                                    // Continue button
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          HapticFeedback.lightImpact();
                                          await _model.pageViewController
                                              ?.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text: FFLocalizations.of(context)
                                            .getText('9udjb2qg'),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding: EdgeInsets.all(8.0),
                                          color: Color(0xD7F0831A),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                              color: Color(0x4CEDF1F7)),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ─── PAGE 2: Interests ───────────────────────
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 80.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('91qhm54s'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xCCFFFFFF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('305cal4q'),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'The Seasons',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText('7zqdbzed'),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Color(0xDA39519F),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: SingleChildScrollView(
                                  controller: _model.columnController,
                                  child: Builder(
                                    builder: (context) {
                                      final interest = FFAppConstants
                                          .OnboardingInterests.toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: interest.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 12.0),
                                        itemBuilder: (context, interestIndex) {
                                          final interestItem =
                                              interest[interestIndex];
                                          return InkWell(
                                            onTap: () async {
                                              HapticFeedback.selectionClick();
                                              safeSetState(() {
                                                if (_model.selectedInterests
                                                    .contains(interestItem)) {
                                                  _model.selectedInterests
                                                      .remove(interestItem);
                                                } else {
                                                  _model.selectedInterests
                                                      .add(interestItem);
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 55.2,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppConstants
                                                      .OnboardingGoalColors
                                                      .firstOrNull,
                                                  Color(0xA3D0E3F7),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                    color: Color(0x48EDF1F7)),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        36.0, 12.0, 24.0, 12.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: Image.asset(
                                                                      'assets/images/f888a650f73ba5acfa7794b87773e0ae64ac7c72.png')
                                                                  .image,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 12.0),
                                                        Text(
                                                          interestItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    if (_model.selectedInterests
                                                        .contains(interestItem))
                                                      Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .success,
                                                        size: 20.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                HapticFeedback.lightImpact();
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              text: FFLocalizations.of(context)
                                  .getText('hpuekj4w'),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsets.all(8.0),
                                color: Color(0xD7F0831A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide:
                                    BorderSide(color: Color(0x4CEDF1F7)),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),

                      // ─── PAGE 3: Journey Goals ───────────────────
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 80.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('xrg87m33'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xCCFFFFFF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('ocf5cd3l'),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'The Seasons',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText('ez2sk1sg'),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Color(0xDA39519F),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowCheckboxGroup(
                              options: [
                                FFLocalizations.of(context).getText('80qqkrk7'),
                                FFLocalizations.of(context).getText('4v01f4la'),
                                FFLocalizations.of(context).getText('55wgp1jp'),
                                FFLocalizations.of(context).getText('wi8rf7cd'),
                                FFLocalizations.of(context).getText('yy8u09oa'),
                                FFLocalizations.of(context).getText('1jz8ob3y'),
                                FFLocalizations.of(context).getText('a1newfsb'),
                              ],
                              onChanged: (val) async {
                                safeSetState(
                                    () => _model.checkboxGroupValues = val);
                                HapticFeedback.lightImpact();
                              },
                              controller:
                                  _model.checkboxGroupValueController ??=
                                      FormFieldController<List<String>>([]),
                              activeColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              checkColor: FlutterFlowTheme.of(context).accent1,
                              checkboxBorderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                              unselectedTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    lineHeight: 1.5,
                                  ),
                              itemPadding: EdgeInsetsDirectional.fromSTEB(
                                  70.0, 8.0, 0.0, 0.0),
                              checkboxBorderRadius: BorderRadius.circular(4.0),
                              initialized: _model.checkboxGroupValues != null,
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                HapticFeedback.lightImpact();
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              text: FFLocalizations.of(context)
                                  .getText('tt7yyfll'),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsets.all(8.0),
                                color: Color(0xD7F0831A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide:
                                    BorderSide(color: Color(0x4CEDF1F7)),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ].divide(SizedBox(height: 32.0)),
                        ),
                      ),

                      // ─── PAGE 4: Enable Notifications ────────────
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 80.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('rymf4v3x'),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: Color(0xCCFFFFFF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText('6yzdx74x'),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'The Seasons',
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText('p6vznrhu'),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: Color(0xDA39519F),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 332.8,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        width: 253.3,
                                        height: 232.6,
                                        child: Lottie.asset(
                                          'assets/jsons/Isometric_data_analysis_(1).json',
                                          width: 200.0,
                                          height: 200.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 12.0),
                                      child: Text(
                                        FFLocalizations.of(context)
                                            .getText('ww0uxlom'),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Finish Profile Creation button
                            FFButtonWidget(
                              onPressed: () async {
                                HapticFeedback.lightImpact();

                                _model.soundPlayer8 ??= AudioPlayer();
                                if (_model.soundPlayer8!.playing) {
                                  await _model.soundPlayer8!.stop();
                                }
                                _model.soundPlayer8!.setVolume(0.78);
                                _model.soundPlayer8!
                                    .setAsset(
                                        'assets/audios/ES_Game,_Jingle,_Chime,_Positive_01_-_Epidemic_Sound_-_0000-1106.wav')
                                    .then((_) => _model.soundPlayer8!.play());

                                await requestPermission(
                                    notificationsPermission);

                                // Wrapped in try-catch so navigation still happens
                                // even if App Check / Firestore fails
                                try {
                                  await currentUserReference!.update({
                                    ...createUsersRecordData(
                                      photoUrl: _model.profilePicture.isNotEmpty
                                          ? _model.profilePicture
                                          : null,
                                      displayName: _model.textController.text,
                                      pronouns:
                                          _model.dropDownValue?.firstOrNull,
                                    ),
                                    ...mapToFirestore({
                                      'OnboardingGoals':
                                          _model.checkboxGroupValues,
                                      'OnboardingInterests':
                                          _model.selectedInterests,
                                    }),
                                  });
                                } catch (e) {
                                  debugPrint(
                                      'Firestore update failed (continuing anyway): $e');
                                }

                                FFAppState().isOnboardingFinished = true;
                                FFAppState().hasSeenOnboarding = false;
                                safeSetState(() {});
                                context.pushNamed(
                                  OnboardingPageViewWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );

                                context.pushNamed(
                                  OnboardingPageViewWidget.routeName,
                                  extra: <String, dynamic>{
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 300),
                                    ),
                                  },
                                );
                              },
                              text: FFLocalizations.of(context)
                                  .getText('rymf4v3x'),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsets.all(8.0),
                                color: Color(0xD7F0831A),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide:
                                    BorderSide(color: Color(0x4CEDF1F7)),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          ].divide(SizedBox(height: 32.0)),
                        ),
                      ),
                    ],
                  ),
                  // Page indicator
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: smooth_page_indicator.SmoothPageIndicator(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        count: 4,
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
                          dotColor: Color(0xDB39519F),
                          activeDotColor: FlutterFlowTheme.of(context).accent1,
                          paintStyle: PaintingStyle.stroke,
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
    );
  }
}
