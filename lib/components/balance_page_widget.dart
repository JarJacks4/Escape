import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'balance_page_model.dart';
export 'balance_page_model.dart';

/// New Component Gen
class BalancePageWidget extends StatefulWidget {
  const BalancePageWidget({super.key});

  @override
  State<BalancePageWidget> createState() => _BalancePageWidgetState();
}

class _BalancePageWidgetState extends State<BalancePageWidget> {
  late BalancePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BalancePageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 60.0, 24.0, 60.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            FFLocalizations.of(context).getText(
              '01t2w1ed' /* How do you feel? */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'WorkSans',
                  color: Colors.white,
                  letterSpacing: 4.0,
                  fontWeight: FontWeight.w300,
                ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0x67161D27),
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Color(0xFF1E2D3D),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 28.0, 24.0, 28.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: LinearPercentIndicator(
                          percent: 0.5,
                          width: 300.0,
                          lineHeight: 12.0,
                          animation: true,
                          animateFromLastPercent: true,
                          progressColor: Color(0xFF8B81FD),
                          backgroundColor: Color(0x9C39519F),
                          barRadius: Radius.circular(10.0),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 14.0,
                              color: FlutterFlowTheme.of(context).tertiary,
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 2.0,
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).tertiary,
                              Color(0xFFC160F2)
                            ],
                            stops: [0.0, 1.0],
                            begin: AlignmentDirectional(0.21, -1.0),
                            end: AlignmentDirectional(-0.21, 1.0),
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF607DDB),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 19.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'xehttu5h' /* Low energy */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0x8DA2F4FD),
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 2.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '5g0bojif' /* Balanced */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0x8DA2F4FD),
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 2.0,
                                  ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '1ybc075f' /* Elevated */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0x8DA2F4FD),
                                    fontSize: 12.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 2.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'x2shunmj' /* Balanced */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).accent2,
                          fontSize: 24.0,
                          letterSpacing: 4.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('BALANCE_SAVE__CONTINUE_BTN_ON_TAP');
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(
                LucilleBody1PageWidget.routeName,
                extra: <String, dynamic>{
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                  ),
                },
              );
            },
            text: FFLocalizations.of(context).getText(
              'y60lf37n' /* Save & Continue */,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 71.0,
              padding: EdgeInsets.all(8.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0x70161D27),
              textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'WorkSans',
                    color: Colors.white,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Color(0xFF1E2D3D),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(28.0),
              hoverColor: Color(0x7639519F),
              hoverBorderSide: BorderSide(
                color: Color(0xD139519F),
                width: 1.0,
              ),
            ),
          ),
        ].divide(SizedBox(height: 40.0)),
      ),
    );
  }
}
