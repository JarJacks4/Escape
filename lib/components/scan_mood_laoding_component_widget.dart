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
import 'scan_mood_laoding_component_model.dart';
export 'scan_mood_laoding_component_model.dart';

/// New Component Gen
class ScanMoodLaodingComponentWidget extends StatefulWidget {
  const ScanMoodLaodingComponentWidget({super.key});

  @override
  State<ScanMoodLaodingComponentWidget> createState() =>
      _ScanMoodLaodingComponentWidgetState();
}

class _ScanMoodLaodingComponentWidgetState
    extends State<ScanMoodLaodingComponentWidget> {
  late ScanMoodLaodingComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanMoodLaodingComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 12.0,
              child: Container(
                width: double.infinity,
                height: 12.2,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16.0,
                      color: Color(0xFF9ED6EC),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      spreadRadius: 19.0,
                    )
                  ],
                  border: Border.all(
                    color: Color(0xFFA2DDE9),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 260.0,
              height: 260.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130.0),
                border: Border.all(
                  color: Color(0xFF00D4FF),
                  width: 1.5,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0x8739519F),
                      borderRadius: BorderRadius.circular(130.0),
                      border: Border.all(
                        color: Color(0xD739519F),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.scatter_plot_rounded,
                        color: Color(0xFF00D4FF),
                        size: 61.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Color(0x840D1F35),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Color(0x961A3A5C),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'ercs3ya9' /* Scanning your mood... */,
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'WorkSans',
                                  color: Color(0xFFE0F0FF),
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'lptl7e56' /* Analyzing emotional signals */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'WorkSans',
                              color: Color(0xFF5A8AB0),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 32.0)),
        ),
      ],
    );
  }
}
