import '/components/sleep_stat_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'glass_card_child3_model.dart';
export 'glass_card_child3_model.dart';

class GlassCardChild3Widget extends StatefulWidget {
  const GlassCardChild3Widget({super.key});

  @override
  State<GlassCardChild3Widget> createState() => _GlassCardChild3WidgetState();
}

class _GlassCardChild3WidgetState extends State<GlassCardChild3Widget> {
  late GlassCardChild3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlassCardChild3Model());
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
        Text(
          FFLocalizations.of(context).getText(
            'khwwo1y0' /* Sleep Stages */,
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
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            wrapWithModel(
              model: _model.sleepStatRowModel1,
              updateCallback: () => safeSetState(() {}),
              child: SleepStatRowWidget(
                color: Color(0xFF6366F1),
                icon: Icon(
                  Icons.brightness_3_rounded,
                  color: Color(0xFF6366F1),
                  size: 18.0,
                ),
                label: 'Deep Sleep',
                value: '1h 45m',
              ),
            ),
            wrapWithModel(
              model: _model.sleepStatRowModel2,
              updateCallback: () => safeSetState(() {}),
              child: SleepStatRowWidget(
                color: Color(0xFFA855F7),
                icon: Icon(
                  Icons.waves_rounded,
                  color: Color(0xFF6366F1),
                  size: 18.0,
                ),
                label: 'REM Sleep',
                value: '2h 10m',
              ),
            ),
            wrapWithModel(
              model: _model.sleepStatRowModel3,
              updateCallback: () => safeSetState(() {}),
              child: SleepStatRowWidget(
                color: Color(0xFFEC4899),
                icon: Icon(
                  Icons.air_rounded,
                  color: Color(0xFF6366F1),
                  size: 18.0,
                ),
                label: 'Light Sleep',
                value: '3h 50m',
              ),
            ),
            wrapWithModel(
              model: _model.sleepStatRowModel4,
              updateCallback: () => safeSetState(() {}),
              child: SleepStatRowWidget(
                color: Color(0xFFF59E0B),
                icon: Icon(
                  Icons.alarm_off_rounded,
                  color: Color(0xFF6366F1),
                  size: 18.0,
                ),
                label: 'Awake',
                value: '15m',
              ),
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
