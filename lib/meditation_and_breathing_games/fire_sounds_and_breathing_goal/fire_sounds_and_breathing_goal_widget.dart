import '/components/confetti_page_intermediate_comp_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'fire_sounds_and_breathing_goal_model.dart';
export 'fire_sounds_and_breathing_goal_model.dart';

class FireSoundsAndBreathingGoalWidget extends StatefulWidget {
  const FireSoundsAndBreathingGoalWidget({super.key});

  static String routeName = 'FireSoundsAndBreathingGoal';
  static String routePath = 'fireSoundsAndBreathingGoal';

  @override
  State<FireSoundsAndBreathingGoalWidget> createState() =>
      _FireSoundsAndBreathingGoalWidgetState();
}

class _FireSoundsAndBreathingGoalWidgetState
    extends State<FireSoundsAndBreathingGoalWidget> {
  late FireSoundsAndBreathingGoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FireSoundsAndBreathingGoalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FireSoundsAndBreathingGoal'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Opacity(
              opacity: 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/summer_campfire.gif',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'txdb4ryg' /* Fire Sounds and Breathing */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'The Seasons',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 22.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'kreu08tw' /* Listen to the fire to feel a t... */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'WorkSans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 6.0)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                      child: FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          'https://firebasestorage.googleapis.com/v0/b/escape-ujuzxr.appspot.com/o/Escape%20Fire%20Sounds%2FFireplace%2C%20Wood%20Burning%2C%20Close%2C%20Crackling%2C%20Exterior%20Atlas%2C%20Morocco.mp3?alt=media&token=3e4b7e77-0b6e-4ba1-84f9-596f989d463e',
                          metas: Metas(
                            id: 'Escape%20Fire%20Sounds%2FFireplace%2C%20Wood%20Burning%2C%20Close%2C%20Crackling%2C%20Exterior%20Atlas%2C%20Morocco.mp3?alt=media&token=3e4b7e77-0b6e-4ba1-84f9-596f989d463e-44b2074d',
                            title:
                                'Fireplace, Wood Burning, Close, Crackling, Exterior Atlas, Morocco',
                          ),
                        ),
                        titleTextStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'The Seasons',
                                  letterSpacing: 0.0,
                                ),
                        playbackDurationTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                ),
                        fillColor: Color(0x41F0831A),
                        playbackButtonColor:
                            FlutterFlowTheme.of(context).alternate,
                        activeTrackColor: FlutterFlowTheme.of(context).accent1,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        elevation: 0.0,
                        playInBackground: PlayInBackground.disabledPause,
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'FIRE_SOUNDS_AND_BREATHING_GOAL_TAP_TO_FI');
                        logFirebaseEvent('Button_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ConfettiPageIntermediateCompWidget(),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      text: FFLocalizations.of(context).getText(
                        'n7kb2mpd' /* Tap to Finish */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 49.4,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent1,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-0.93, -0.86),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.arrow_back,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'FIRE_SOUNDS_AND_BREATHING_GOAL_arrow_bac');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
