import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'how_are_you_feeling_assessment_comp_model.dart';
export 'how_are_you_feeling_assessment_comp_model.dart';

/// New Component Gen
class HowAreYouFeelingAssessmentCompWidget extends StatefulWidget {
  const HowAreYouFeelingAssessmentCompWidget({super.key});

  @override
  State<HowAreYouFeelingAssessmentCompWidget> createState() =>
      _HowAreYouFeelingAssessmentCompWidgetState();
}

class _HowAreYouFeelingAssessmentCompWidgetState
    extends State<HowAreYouFeelingAssessmentCompWidget> {
  late HowAreYouFeelingAssessmentCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HowAreYouFeelingAssessmentCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF2D2A3E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'd2q0a4fr' /* Mental Health Check-in */,
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Container(
                    width: 28.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF4A4760),
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 6.0,
                decoration: BoxDecoration(
                  color: Color(0xFF4A4760),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.2,
                    height: 6.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF6B8A),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF4A4760),
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.sentiment_satisfied_outlined,
                        color: Color(0xFFA89FC8),
                        size: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'dm6tq1bu' /* Question 1 of 6 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'WorkSans',
                          color: Color(0xFFA89FC8),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'fwdzvohs' /* How are you feeling today? */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'The Seasons',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '6a8tmext' /* Select the emoji that best rep... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'WorkSans',
                          color: Color(0xFFA89FC8),
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(height: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[].divide(SizedBox(width: 8.0)),
              ),
              Container(
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Color(0xFF3D3A52),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'gfmsyuy8' /* Next */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'WorkSans',
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
