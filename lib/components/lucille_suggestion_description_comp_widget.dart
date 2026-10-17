import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'lucille_suggestion_description_comp_model.dart';
export 'lucille_suggestion_description_comp_model.dart';

class LucilleSuggestionDescriptionCompWidget extends StatefulWidget {
  const LucilleSuggestionDescriptionCompWidget({
    super.key,
    this.exerciseDescription,
  });

  final String? exerciseDescription;

  @override
  State<LucilleSuggestionDescriptionCompWidget> createState() =>
      _LucilleSuggestionDescriptionCompWidgetState();
}

class _LucilleSuggestionDescriptionCompWidgetState
    extends State<LucilleSuggestionDescriptionCompWidget>
    with TickerProviderStateMixin {
  late LucilleSuggestionDescriptionCompModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => LucilleSuggestionDescriptionCompModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LUCILLE_SUGGESTION_DESCRIPTION_LucilleSu');
      logFirebaseEvent('LucilleSuggestionDescriptionComp_update_');
      _model.exerciseID = FFAppState().exerciseID;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 70.0),
            end: Offset(0.0, 0.0),
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

    // Self-sized card: the reason wraps inside it (it used to run off the right edge in a
    // horizontal scroll row), on a solid background so the card behind doesn't show through.
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xF21B1F4B),
              boxShadow: [
                BoxShadow(
                  blurRadius: 30.0,
                  color: Color(0x99F0831A),
                  offset: Offset(0.0, 0.0),
                )
              ],
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: Color(0x66F0831A),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(22.0, 20.0, 22.0, 22.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why this session?',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 10.0),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height * 0.25,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        valueOrDefault<String>(
                          widget.exerciseDescription,
                          'Lucille picked this session based on your latest mood scan and what has helped you before.',
                        ),
                        softWrap: true,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'WorkSans',
                              color: Color(0xFFEDF1F7),
                              fontSize: 15.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
      ),
    );
  }
}
