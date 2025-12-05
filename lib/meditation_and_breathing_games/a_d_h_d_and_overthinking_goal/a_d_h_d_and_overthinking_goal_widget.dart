import '/components/confetti_page_expert_comp_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'a_d_h_d_and_overthinking_goal_model.dart';
export 'a_d_h_d_and_overthinking_goal_model.dart';

class ADHDAndOverthinkingGoalWidget extends StatefulWidget {
  const ADHDAndOverthinkingGoalWidget({super.key});

  static String routeName = 'ADHDAndOverthinkingGoal';
  static String routePath = 'aDHDAndOverthinkingGoal';

  @override
  State<ADHDAndOverthinkingGoalWidget> createState() =>
      _ADHDAndOverthinkingGoalWidgetState();
}

class _ADHDAndOverthinkingGoalWidgetState
    extends State<ADHDAndOverthinkingGoalWidget> {
  late ADHDAndOverthinkingGoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ADHDAndOverthinkingGoalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ADHDAndOverthinkingGoal'});
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
        body: Container(
          height: MediaQuery.sizeOf(context).height * 1.063,
          child: Stack(
            children: [
              Opacity(
                opacity: 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/GIF_from_GIFER.gif',
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
                                        '5onefgdb' /* ADHD and Overthinking */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'The Seasons',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'rh7xaj23' /* Binaural Beats are brainwave s... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
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
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 15.0, 0.0),
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
                                        'A_D_H_D_AND_OVERTHINKING_GOAL_arrow_back');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.safePop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 300.0, 0.0, 8.0),
                        child: FlutterFlowAudioPlayer(
                          audio: Audio.network(
                            'https://firebasestorage.googleapis.com/v0/b/escape-self-care-ai.firebasestorage.app/o/binaural_delta_500_501-5hz-19563.mp3?alt=media&token=0c78eb05-8665-4123-9fe3-b6ef67d13a1e',
                            metas: Metas(
                              id: 'binaural_delta_500_501-5hz-19563.mp3?alt=media&token=0c78eb05-8665-4123-9fe3-b6ef67d13a1e-b69128ff',
                              title: 'Binaural Delta 5 501-5Hz',
                            ),
                          ),
                          titleTextStyle: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                              ),
                          playbackDurationTextStyle:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                          fillColor: Color(0x4ED0E3F7),
                          playbackButtonColor:
                              FlutterFlowTheme.of(context).accent1,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent1,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primary,
                          elevation: 0.0,
                          playInBackground: PlayInBackground.disabledPause,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'A_D_H_D_AND_OVERTHINKING_GOAL_TAP_TO_FIN');
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
                                  child: ConfettiPageExpertCompWidget(),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'zwo21zbo' /* Tap to Finish */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 49.4,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
