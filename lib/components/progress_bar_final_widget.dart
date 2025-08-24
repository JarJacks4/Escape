import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'progress_bar_final_model.dart';
export 'progress_bar_final_model.dart';

class ProgressBarFinalWidget extends StatefulWidget {
  const ProgressBarFinalWidget({super.key});

  @override
  State<ProgressBarFinalWidget> createState() => _ProgressBarFinalWidgetState();
}

class _ProgressBarFinalWidgetState extends State<ProgressBarFinalWidget>
    with TickerProviderStateMixin {
  late ProgressBarFinalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgressBarFinalModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
      'progressBarOnPageLoadAnimation': AnimationInfo(
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return Container(
      width: double.infinity,
      height: 54.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
        boxShadow: [
          BoxShadow(
            blurRadius: 1.0,
            color: FlutterFlowTheme.of(context).primaryBackground,
            offset: Offset(
              0.0,
              1.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PROGRESS_BAR_FINAL_Image_yzyz94b6_ON_TAP');
                        logFirebaseEvent('Image_update_app_state');

                        _model.updatePage(() {});
                      },
                      child: Hero(
                        tag: currentUserPhoto,
                        transitionOnUserGestures: true,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Image.network(
                            currentUserPhoto,
                            width: 46.37,
                            height: 46.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => Text(
                    valueOrDefault<String>(
                      currentUserDisplayName,
                      'Jane Doe',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'The Seasons',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ).animateOnPageLoad(
                      animationsMap['textOnPageLoadAnimation']!),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
            child: VerticalDivider(
              thickness: 1.0,
              indent: 8.0,
              endIndent: 8.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                  child: Container(
                    width: 185.88,
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 20.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: FFAppState().pointsEarned.toDouble(),
                          width: MediaQuery.sizeOf(context).width * 0.45,
                          lineHeight: 25.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: FlutterFlowTheme.of(context).accent1,
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          center: Text(
                            valueOrDefault<String>(
                              FFAppState().pointsEarned.toString(),
                              '0 Points',
                            ).maybeHandleOverflow(
                              maxChars: 50,
                              replacement: '…',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                          barRadius: Radius.circular(80.0),
                          padding: EdgeInsets.zero,
                        ).animateOnPageLoad(
                            animationsMap['progressBarOnPageLoadAnimation']!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
