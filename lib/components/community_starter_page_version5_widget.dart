import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'community_starter_page_version5_model.dart';
export 'community_starter_page_version5_model.dart';

/// New Component Gen
class CommunityStarterPageVersion5Widget extends StatefulWidget {
  const CommunityStarterPageVersion5Widget({super.key});

  @override
  State<CommunityStarterPageVersion5Widget> createState() =>
      _CommunityStarterPageVersion5WidgetState();
}

class _CommunityStarterPageVersion5WidgetState
    extends State<CommunityStarterPageVersion5Widget> {
  late CommunityStarterPageVersion5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityStarterPageVersion5Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.863,
                height: 228.4,
                decoration: BoxDecoration(),
                child: Lottie.asset(
                  'assets/jsons/connecting.json',
                  width: 200.0,
                  height: 182.08,
                  fit: BoxFit.contain,
                  animate: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'nb77fu90' /* Join the Exploratory Collectiv... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'The Seasons',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.group,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'k16gekuj' /* 15K+ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'eb40v2uf' /* Wanderers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.explore,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'mdqgdcv4' /* 75K+ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'dc4ti7mj' /* Journeys */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'xc1qb0vh' /* 98% */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'WorkSans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              '5b0h4lsy' /* Enchanted */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x66FFFFFF),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Color(0x6EE5E7EB),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1526510747491-58f928ec870f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU4Mzg5NzV8&ixlib=rb-4.1.0&q=80&w=1080',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '1blpo5t1' /* Escape turned my routine into ... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEFB011),
                                  size: 16.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEFB011),
                                  size: 16.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEFB011),
                                  size: 16.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEFB011),
                                  size: 16.0,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFEFB011),
                                  size: 16.0,
                                ),
                              ].divide(SizedBox(width: 2.0)),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 12.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'COMMUNITY_STARTER_VERSION5_SPARK_CONNECT');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.lightImpact();
                      logFirebaseEvent('Button_play_sound');
                      _model.soundPlayer1 ??= AudioPlayer();
                      if (_model.soundPlayer1!.playing) {
                        await _model.soundPlayer1!.stop();
                      }
                      _model.soundPlayer1!.setVolume(1.0);
                      _model.soundPlayer1!
                          .setAsset(
                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                          .then((_) => _model.soundPlayer1!.play());

                      logFirebaseEvent('Button_update_app_state');
                      FFAppState().isFirstTimeUserLucille =
                          !(FFAppState().isFirstTimeUserLucille ?? true);
                      FFAppState().update(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'u8zxctoc' /* Spark Connections */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF39519F),
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily: 'WorkSans',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'COMMUNITY_STARTER_VERSION5_SOLO_FIRST_BT');
                      logFirebaseEvent('Button_haptic_feedback');
                      HapticFeedback.mediumImpact();
                      logFirebaseEvent('Button_play_sound');
                      _model.soundPlayer2 ??= AudioPlayer();
                      if (_model.soundPlayer2!.playing) {
                        await _model.soundPlayer2!.stop();
                      }
                      _model.soundPlayer2!.setVolume(1.0);
                      _model.soundPlayer2!
                          .setAsset(
                              'assets/audios/ES_UI_Buttons,_Glassy,_Touch_-_Epidemic_Sound.mp3')
                          .then((_) => _model.soundPlayer2!.play());

                      logFirebaseEvent('Button_navigate_to');

                      context.pushNamed(
                        HomeVersion5Widget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 1),
                          ),
                        },
                      );
                    },
                    text: FFLocalizations.of(context).getText(
                      'bjlr6v27' /* Solo First */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 60.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.white,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily: 'WorkSans',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Color(0x5B5A5C60),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Hero(
                tag: 'LucilleLogo',
                transitionOnUserGestures: true,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo_ESCAPE_White.png',
                    width: 200.0,
                    height: 47.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
