import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'sleep_stage_row_model.dart';
export 'sleep_stage_row_model.dart';

class SleepStageRowWidget extends StatefulWidget {
  const SleepStageRowWidget({
    super.key,
    Color? color,
    String? duration,
    this.icon,
    String? label,
    double? progress,
  })  : this.color = color ?? const Color(0x00000000),
        this.duration = duration ?? '1h 45m',
        this.label = label ?? 'Deep Sleep',
        this.progress = progress ?? 0.25;

  final Color color;
  final String duration;
  final Widget? icon;
  final String label;
  final double progress;

  @override
  State<SleepStageRowWidget> createState() => _SleepStageRowWidgetState();
}

class _SleepStageRowWidgetState extends State<SleepStageRowWidget> {
  late SleepStageRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepStageRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Color(0x66FFFFFF),
                borderRadius: BorderRadius.circular(16.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0x4DFFFFFF),
                  width: 1.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: widget.icon!,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
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
                    valueOrDefault<String>(
                      widget.label,
                      'Deep Sleep',
                    ),
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.cormorantSc(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.duration,
                      '1h 45m',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.workSans(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                        ),
                  ),
                ],
              ),
              LinearPercentIndicator(
                percent: valueOrDefault<double>(
                  widget.progress,
                  0.25,
                ),
                lineHeight: 6.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: valueOrDefault<Color>(
                  widget.color,
                  FlutterFlowTheme.of(context).primary,
                ),
                backgroundColor: Color(0x1A1C2444),
                barRadius: Radius.circular(3.0),
                padding: EdgeInsets.zero,
              ),
            ].divide(SizedBox(height: 4.0)),
          ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
