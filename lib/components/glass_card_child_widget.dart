import '/components/pie_chart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'glass_card_child_model.dart';
export 'glass_card_child_model.dart';

class GlassCardChildWidget extends StatefulWidget {
  const GlassCardChildWidget({super.key});

  @override
  State<GlassCardChildWidget> createState() => _GlassCardChildWidgetState();
}

class _GlassCardChildWidgetState extends State<GlassCardChildWidget> {
  late GlassCardChildModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlassCardChildModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            '5c4t9v75' /* Tonight's Goal */,
          ),
          style: FlutterFlowTheme.of(context).titleMedium.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
              ),
        ),
        Container(
          height: 220.0,
          alignment: AlignmentDirectional(0.0, 0.0),
          child: wrapWithModel(
            model: _model.pieChartModel,
            updateCallback: () => safeSetState(() {}),
            child: PieChartWidget(
              data: '85,15',
              labels: 'Slept,Remaining',
              colors: 'primary,surface_variant',
              centerValue: '7h 45m',
              centerValuePresent: true,
              centerLabel: 'of 8h goal',
              centerLabelPresent: true,
              animate: false,
              startAngle: -90.0,
              variant: 'donut',
              size: 'expanded',
              legend: 'hidden',
              legendValue: 'percent',
              ring: 'thick',
              gap: 'normal',
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'l27a0bda' /* Bedtime */,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'eu3m4nap' /* 10:30 PM */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
            Container(
              width: 1.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'xqg36abl' /* Wake up */,
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.plusJakartaSans(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelSmall.fontStyle,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '3g46qj3p' /* 06:15 AM */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ],
        ),
      ].divide(SizedBox(height: 24.0)),
    );
  }
}
