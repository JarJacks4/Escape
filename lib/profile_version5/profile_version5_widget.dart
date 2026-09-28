import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/delete_account_bottom_sheet_widget.dart';
import '/components/edit_profile_version5_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'profile_version5_model.dart';
export 'profile_version5_model.dart';

class ProfileVersion5Widget extends StatefulWidget {
  const ProfileVersion5Widget({super.key});

  static String routeName = 'ProfileVersion5';
  static String routePath = '/profileVersion5';

  @override
  State<ProfileVersion5Widget> createState() => _ProfileVersion5WidgetState();
}

class _ProfileVersion5WidgetState extends State<ProfileVersion5Widget> {
  late ProfileVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileVersion5Model());

    _model.newProfilePic = FFAppState().ProfilePicture.isNotEmpty
      ? FFAppState().ProfilePicture
      : currentUserPhoto;

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileVersion5'});
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                    ).image,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 415.8,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x231C2444),
                              Color(0x7839519F),
                              Color(0x88673AB7)
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: AlignmentDirectional(1.0, -0.64),
                            end: AlignmentDirectional(-1.0, 0.64),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: SingleChildScrollView(
                            controller: _model.columnController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 55.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'PROFILE_VERSION5_arrow_back_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_back');
                                            context.safePop();
                                          },
                                        ),
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '3ykfqy16' /* Profile */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'The Seasons',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        FlutterFlowIconButton(
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.settings,
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'PROFILE_VERSION5_settings_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_to');

                                            context.pushNamed(
                                              SettingsWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                  duration:
                                                      Duration(milliseconds: 2),
                                                ),
                                              },
                                            );
                                          },
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 5.0,
                                                  shape: const CircleBorder(),
                                                  child: Container(
                                                    width: 120.0,
                                                    height: 120.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x0B000000),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 35.0,
                                                          color:
                                                              Color(0xCFEDF1F7),
                                                          offset: Offset(
                                                            0.0,
                                                            0.0,
                                                          ),
                                                          spreadRadius: 40.0,
                                                        )
                                                      ],
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0x6BEDF1F7),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Hero(
                                                  tag: 'profile_pic_hero',
                                                  transitionOnUserGestures:
                                                      true,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 700),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 700),
                                                      imageUrl:
                                                          _model.newProfilePic!,
                                                      width: 117.6,
                                                      height: 120.0,
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          Alignment(0.0, 0.0),
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.jpg',
                                                        width: 117.6,
                                                        height: 120.0,
                                                        fit: BoxFit.cover,
                                                        alignment:
                                                            Alignment(0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.38, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0.0, 100.0,
                                                          25.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderRadius: 50.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent1,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PROFILE_VERSION5_PAGE_add_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_haptic_feedback');
                                                      HapticFeedback
                                                          .heavyImpact();
                                                      logFirebaseEvent(
                                                          'IconButton_play_sound');
                                                      _model.soundPlayer1 ??=
                                                          AudioPlayer();
                                                      if (_model.soundPlayer1!
                                                          .playing) {
                                                        await _model
                                                            .soundPlayer1!
                                                            .stop();
                                                      }
                                                      _model.soundPlayer1!
                                                          .setVolume(1.0);
                                                      _model.soundPlayer1!
                                                          .setAsset(
                                                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                                                          .then((_) => _model
                                                              .soundPlayer1!
                                                              .play());

                                                      logFirebaseEvent(
                                                          'IconButton_upload_media_to_firebase');
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
                                                                .isDataUploading_uploadDataTyq8 =
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
                                                          _model.isDataUploading_uploadDataTyq8 =
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
                                                            _model.uploadedLocalFile_uploadDataTyq8 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl_uploadDataTyq8 =
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

                                                      logFirebaseEvent(
                                                          'IconButton_update_page_state');
                                                      _model.newProfilePic = _model
                                                          .uploadedFileUrl_uploadDataTyq8;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'IconButton_update_app_state');
                                                      FFAppState()
                                                              .ProfilePicture =
                                                          _model.newProfilePic!;
                                                      FFAppState()
                                                          .update(() {});
                                                      logFirebaseEvent(
                                                          'IconButton_backend_call');

                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        photoUrl: _model
                                                            .uploadedFileUrl_uploadDataTyq8,
                                                      ));
                                                      logFirebaseEvent(
                                                          'IconButton_show_snack_bar');
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Picture Uploaded!',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) =>
                                                  AnimatedDefaultTextStyle(
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                duration:
                                                    Duration(milliseconds: 195),
                                                curve: Curves.easeIn,
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    currentUserDisplayName,
                                                    'Jane Doe',
                                                  ),
                                                  overflow: TextOverflow.fade,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'luztmkj2' /* Finding peace within. */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 126.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x2CEDF1F7),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0xE6EDF1F7),
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0x48EDF1F7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'l6td3vta' /* Journey Progress */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '0vxeacjm' /* Keep nurturing your growth */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          AnimatedDefaultTextStyle(
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    1650),
                                                            curve:
                                                                Curves.easeIn,
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                formatNumber(
                                                                  FFAppState()
                                                                      .pointsEarnedPercentage,
                                                                  formatType:
                                                                      FormatType
                                                                          .percent,
                                                                ),
                                                                '0',
                                                              ),
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .local_fire_department,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            size: 24.0,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 26.76,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: valueOrDefault<
                                                            double>(
                                                          FFAppState()
                                                              .pointsEarnedPercentage,
                                                          0.0,
                                                        ).clamp(0.0, 1.0),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.85,
                                                        lineHeight: 30.0,
                                                        animation: true,
                                                        animateFromLastPercent:
                                                            true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        backgroundColor:
                                                            Color(0xB4D0E3F7),
                                                        center: Text(
                                                          formatNumber(
                                                            FFAppState()
                                                                .pointsEarnedPercentage,
                                                            formatType:
                                                                FormatType
                                                                    .percent,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                        barRadius:
                                                            Radius.circular(
                                                                50.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          elevation: 5.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 126.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x2CEDF1F7),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 10.0,
                                                  color: Color(0xE6EDF1F7),
                                                  offset: Offset(
                                                    0.0,
                                                    0.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: Color(0x48EDF1F7),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Flexible(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'cenq1ik1' /* Escape Coins Earned 
This Week */
                                                                  ,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'The Seasons',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '7x4244r8' /* Number of Escape Coins Earned ... */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              AnimatedDefaultTextStyle(
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        600),
                                                                curve: Curves
                                                                    .easeIn,
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .pointsEarned
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                ),
                                                              ),
                                                              FaIcon(
                                                                FontAwesomeIcons
                                                                    .coins,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 24.0,
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 4.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 351.8,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent3,
                                            offset: Offset(
                                              0.0,
                                              0.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PROFILE_VERSION5_EDIT_PROFILE_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            EditProfileVersion5Widget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'f8234cvd' /* Edit Profile */,
                                            ),
                                            icon: Icon(
                                              Icons.edit,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.75,
                                              height: 57.6,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PROFILE_VERSION5_PAGE_JOURNAL_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.pushNamed(
                                                JournalPageVersion5Widget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 2),
                                                  ),
                                                },
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'rzcippuh' /* Journal */,
                                            ),
                                            icon: Icon(
                                              Icons.book,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 88.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              color: Color(0x8639519F),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color: Color(0x4FEDF1F7),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              print('Button pressed ...');
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'xri65j60' /* Reflect */,
                                            ),
                                            icon: Icon(
                                              Icons.favorite,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 88.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              color: Color(0xCDFCC462),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'The Seasons',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color: Color(0x56EDF1F7),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 162.4,
                                          height: 64.7,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 40.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PROFILE_VERSION5_DELETE_ACCOUNT_BTN_ON_T');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer2 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer2!.playing) {
                                                await _model.soundPlayer2!
                                                    .stop();
                                              }
                                              _model.soundPlayer2!
                                                  .setVolume(1.0);
                                              _model.soundPlayer2!
                                                  .setAsset(
                                                      'assets/audios/ES_Game_Over,_Defeat,_Loss,_Negative,_Notification_01_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer2!
                                                      .play());

                                              logFirebaseEvent(
                                                  'Button_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            DeleteAccountBottomSheetWidget(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'z5724ter' /* Delete Account */,
                                            ),
                                            icon: Icon(
                                              FFIcons.kdeleteDocument,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 36.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              color: Colors.black,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 5.0,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 180.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 40.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                offset: Offset(
                                                  0.0,
                                                  0.0,
                                                ),
                                                spreadRadius: 5.0,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'PROFILE_VERSION5_PAGE_LOG_OUT_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_haptic_feedback');
                                              HapticFeedback.heavyImpact();
                                              logFirebaseEvent(
                                                  'Button_play_sound');
                                              _model.soundPlayer3 ??=
                                                  AudioPlayer();
                                              if (_model
                                                  .soundPlayer3!.playing) {
                                                await _model.soundPlayer3!
                                                    .stop();
                                              }
                                              _model.soundPlayer3!
                                                  .setVolume(1.0);
                                              _model.soundPlayer3!
                                                  .setAsset(
                                                      'assets/audios/ES_Game_Over,_Defeat,_Loss,_Negative,_Notification_01_-_Epidemic_Sound.mp3')
                                                  .then((_) => _model
                                                      .soundPlayer3!
                                                      .play());

                                              logFirebaseEvent('Button_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              await authManager.signOut();
                                              GoRouter.of(context)
                                                  .clearRedirectLocation();

                                              context.goNamedAuth(
                                                  SplashScreenVersion5Widget
                                                      .routeName,
                                                  context.mounted);
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'jd2z2up9' /* Log-Out */,
                                            ),
                                            icon: Icon(
                                              Icons.logout,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 60.0,
                                              padding: EdgeInsets.all(8.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 5.0,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 16.0)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 25.0),
                                      child: Hero(
                                        tag: 'logo',
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Logo_ESCAPE_White.png',
                                            width: 200.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.09,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 24.0)),
                            ),
                          ),
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
