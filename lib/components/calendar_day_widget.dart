import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_day_model.dart';
export 'calendar_day_model.dart';

class CalendarDayWidget extends StatefulWidget {
  const CalendarDayWidget({
    super.key,
    String? day,
    bool? isToday,
    String? status,
  })  : this.day = day ?? '25',
        this.isToday = isToday ?? false,
        this.status = status ?? 'none';

  final String day;
  final bool isToday;
  final String status;

  @override
  State<CalendarDayWidget> createState() => _CalendarDayWidgetState();
}

class _CalendarDayWidgetState extends State<CalendarDayWidget> {
  late CalendarDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarDayModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9999.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          width: 44.0,
          height: 44.0,
          decoration: BoxDecoration(
            color: () {
              if (widget.status == 'negative') {
                return Color(0x00000000);
              } else if (widget.status == 'neutral') {
                return Color(0x4D39519F);
              } else if (widget.status == 'positive') {
                return Color(0x00000000);
              } else if (widget.isToday) {
                return FlutterFlowTheme.of(context).primary;
              } else {
                return Color(0x66FFFFFF);
              }
            }(),
            borderRadius: BorderRadius.circular(9999.0),
            shape: BoxShape.rectangle,
            border: Border.all(
              color: widget.isToday
                  ? FlutterFlowTheme.of(context).primary
                  : Color(0x4DFFFFFF),
              width: widget.isToday ? 2.0 : 1.0,
            ),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Text(
            valueOrDefault<String>(
              widget.day,
              '25',
            ),
            style: FlutterFlowTheme.of(context).labelLarge.override(
                  font: GoogleFonts.workSans(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
                  color: widget.isToday
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                ),
          ),
        ),
      ),
    );
  }
}
