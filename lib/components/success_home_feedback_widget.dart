import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'success_home_feedback_model.dart';
export 'success_home_feedback_model.dart';

class SuccessHomeFeedbackWidget extends StatefulWidget {
  const SuccessHomeFeedbackWidget({super.key});

  @override
  State<SuccessHomeFeedbackWidget> createState() =>
      _SuccessHomeFeedbackWidgetState();
}

class _SuccessHomeFeedbackWidgetState extends State<SuccessHomeFeedbackWidget> {
  late SuccessHomeFeedbackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessHomeFeedbackModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Divider(
          thickness: 2.0,
          indent: 50.0,
          endIndent: 50.0,
          color: FlutterFlowTheme.of(context).secondary,
        ),
        Flexible(
          flex: 1,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Lottie.asset(
                    'assets/jsons/Animation_-_1739409804384.json',
                    width: 400.0,
                    height: 305.49,
                    fit: BoxFit.contain,
                    frameRate: FrameRate(60.0),
                    repeat: false,
                    animate: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(3.0),
          child: Text(
            FFLocalizations.of(context).getText(
              'r1zpzg96' /* Welcome */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'The Seasons',
                  color: FlutterFlowTheme.of(context).secondary,
                  fontSize: 50.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 12.0, 15.0, 0.0),
          child: Text(
            FFLocalizations.of(context).getText(
              '18e5egl2' /* Welcome to Escape!

 I am Luci... */
              ,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'The Seasons',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w300,
                  useGoogleFonts: false,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SUCCESS_HOME_FEEDBACK_LOOK_AT_SELF_CARE_');
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(
                'SelfCarePlanPage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 5),
                  ),
                },
              );
            },
            text: FFLocalizations.of(context).getText(
              'oug0tg5u' /* Look at Self Care Plan */,
            ),
            options: FFButtonOptions(
              width: 246.3,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xC0F0831A),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'The Seasons',
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
              elevation: 3.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('SUCCESS_HOME_FEEDBACK_DISMISS_BTN_ON_TAP');
              logFirebaseEvent('Button_bottom_sheet');
              Navigator.pop(context);
            },
            text: FFLocalizations.of(context).getText(
              'nit8bfpi' /* Dismiss */,
            ),
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'WorkSans',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Hero(
            tag: 'SuccessFeedback',
            transitionOnUserGestures: true,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Logo_ESCAPE_Black.png',
                width: 100.0,
                height: 50.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
