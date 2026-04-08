import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'usage_credit_exceded_model.dart';
export 'usage_credit_exceded_model.dart';

class UsageCreditExcededWidget extends StatefulWidget {
  const UsageCreditExcededWidget({super.key});

  @override
  State<UsageCreditExcededWidget> createState() =>
      _UsageCreditExcededWidgetState();
}

class _UsageCreditExcededWidgetState extends State<UsageCreditExcededWidget> {
  late UsageCreditExcededModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsageCreditExcededModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 300.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          alignment: AlignmentDirectional(1.0, -1.0),
          children: [
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        FFIcons.kcaution,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 24.0,
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'maeskr2j' /* Usage Credit Limit Reached */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'WorkSans',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '1o8cnphd' /* You have reached your free usa... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'di7dqe8k' /* Please  */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  '6rxehf3m' /* see our Subscriber Policies */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'z35paghk' /*  and get more tokens on your n... */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'xoy62i7y' /*  month of Escape */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).accent1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'pou7ehk7' /*  to get more access to Lucille... */,
                                ),
                                style: TextStyle(
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ].divide(SizedBox(height: 16.0)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('USAGE_CREDIT_EXCEDED_Icon_p6whfom5_ON_TA');
                  // Close dialog
                  logFirebaseEvent('Icon_Closedialog');
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
