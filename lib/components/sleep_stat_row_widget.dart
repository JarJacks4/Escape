import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sleep_stat_row_model.dart';
export 'sleep_stat_row_model.dart';

class SleepStatRowWidget extends StatefulWidget {
  const SleepStatRowWidget({
    super.key,
    Color? color,
    this.icon,
    String? label,
    String? value,
  })  : this.color = color ?? const Color(0xFF6366F1),
        this.label = label ?? 'Deep Sleep',
        this.value = value ?? '1h 45m';

  final Color color;
  final Widget? icon;
  final String label;
  final String value;

  @override
  State<SleepStatRowWidget> createState() => _SleepStatRowWidgetState();
}

class _SleepStatRowWidgetState extends State<SleepStatRowWidget> {
  late SleepStatRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SleepStatRowModel());
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.color,
                  Color(0xFF6366F1),
                ),
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
              ),
              child: widget.icon!,
            ),
            Text(
              valueOrDefault<String>(
                widget.label,
                'Deep Sleep',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.plusJakartaSans(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
        Text(
          valueOrDefault<String>(
            widget.value,
            '1h 45m',
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
        ),
      ].divide(SizedBox(width: 16.0)),
    );
  }
}
