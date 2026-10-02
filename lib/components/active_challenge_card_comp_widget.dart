import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;
import 'package:cupertino_time_picker_hiuzb7/app_state.dart'
    as cupertino_time_picker_hiuzb7_app_state;
import 'package:that_audio_player_oo85ab/app_state.dart'
    as that_audio_player_oo85ab_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'active_challenge_card_comp_model.dart';
export 'active_challenge_card_comp_model.dart';

class ActiveChallengeCardCompWidget extends StatefulWidget {
  const ActiveChallengeCardCompWidget({
    super.key,
    this.challengeID,
    this.title,
    this.description,
    this.reward,
  });

  final String? challengeID;
  final String? title;
  final String? description;
  final String? reward;

  @override
  State<ActiveChallengeCardCompWidget> createState() =>
      _ActiveChallengeCardCompWidgetState();
}

class _ActiveChallengeCardCompWidgetState
    extends State<ActiveChallengeCardCompWidget> {
  late ActiveChallengeCardCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActiveChallengeCardCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<cupertino_time_picker_hiuzb7_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<confetti_modualo_library_b75kfy_app_state.FFAppState>();
    context.watch<that_audio_player_oo85ab_app_state.FFAppState>();

    return Container(
      width: 311.0,
      height: 190.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: FlutterFlowTheme.of(context).primary,
            offset: Offset(
              0.0,
              0.0,
            ),
            spreadRadius: 2.0,
          )
        ],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/vulnerability.gif',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.title,
                          'Vulnerability Explorer',
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .fontStyle,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          widget.description,
                          'Share 3 authentic emotional moments this week',
                        ),
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.emoji_events,
                  color: FlutterFlowTheme.of(context).accent4,
                  size: 16.0,
                ),
                Text(
                  valueOrDefault<String>(
                    widget.reward,
                    'Reward: Empathy Badge + 300 XP',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).accent3,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
              ].divide(SizedBox(width: 4.0)),
            ),
            if (FFAppState().joinedChallenges.contains(widget.challengeID))
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('ACTIVE_CHALLENGE_CARD__JOIN_CHALLENGE_BT');
                  if (FFAppState()
                      .joinedChallenges
                      .contains(widget.challengeID)) {
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState()
                        .removeFromJoinedChallenges(widget.challengeID!);
                    _model.updatePage(() {});
                    logFirebaseEvent('Button_show_snack_bar');
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'You Have Declined ${widget.title}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 2500),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  } else {
                    logFirebaseEvent('Button_update_app_state');
                    FFAppState().addToJoinedChallenges(widget.challengeID!);
                    _model.updatePage(() {});
                    logFirebaseEvent('Button_show_snack_bar');
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'You Have Joined: ${widget.title}',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 2500),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                },
                text: FFLocalizations.of(context).getText(
                  'x75dqfk5' /* + Join Challenge */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent3,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
          ].divide(SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
