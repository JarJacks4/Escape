import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'glass_card_child2_model.dart';
export 'glass_card_child2_model.dart';

class GlassCardChild2Widget extends StatefulWidget {
  const GlassCardChild2Widget({super.key});

  @override
  State<GlassCardChild2Widget> createState() => _GlassCardChild2WidgetState();
}

class _GlassCardChild2WidgetState extends State<GlassCardChild2Widget> {
  late GlassCardChild2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlassCardChild2Model());
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'eye5b0dw' /* Weekly Trends */,
              ),
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
            ),
            Text(
              FFLocalizations.of(context).getText(
                '4agqq8db' /* See all */,
              ),
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
            ),
          ],
        ),
        Container(
          height: 160.0,
          child: Container(
            height: 160.0,
            child: FlutterFlowBarChart(
              barData: [
                FFBarChartData(
                  yData: ([6.0, 7.5, 8.2, 6.8, 7.2, 8.0, 7.8]),
                  color: FlutterFlowTheme.of(context).primary,
                )
              ],
              xLabels: (['M', 'T', 'W', 'T', 'F', 'S', 'S']),
              barWidth: 16.0,
              barBorderRadius: BorderRadius.circular(8.0),
              groupSpace: 12.0,
              alignment: BarChartAlignment.spaceEvenly,
              chartStylingInfo: ChartStylingInfo(
                backgroundColor: Colors.transparent,
                showBorder: false,
              ),
              axisBounds: AxisBounds(
                minY: 0.0,
                maxX: 6.0,
                maxY: 9.839999999999998,
              ),
              xAxisLabelInfo: AxisLabelInfo(
                showLabels: true,
                labelTextStyle: FlutterFlowTheme.of(context).bodySmall.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodySmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 10.0,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodySmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      lineHeight: 1.0,
                    ),
                reservedSize: 20.0,
              ),
              yAxisLabelInfo: AxisLabelInfo(
                reservedSize: 0.0,
              ),
            ),
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
