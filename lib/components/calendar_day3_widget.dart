import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_day3_model.dart';
export 'calendar_day3_model.dart';

class CalendarDay3Widget extends StatefulWidget {
  const CalendarDay3Widget({
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
  State<CalendarDay3Widget> createState() => _CalendarDay3WidgetState();
}

class _CalendarDay3WidgetState extends State<CalendarDay3Widget> {
  late CalendarDay3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarDay3Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          () {
            if (valueOrDefault<String>(
                  widget.status,
                  'none',
                ) ==
                'negative') {
              return Color(0x00000000);
            } else if (valueOrDefault<String>(
                  widget.status,
                  'none',
                ) ==
                'neutral') {
              return FlutterFlowTheme.of(context).warning20;
            } else if (valueOrDefault<String>(
                  widget.status,
                  'none',
                ) ==
                'positive') {
              return Color(0x00000000);
            } else {
              return Colors.transparent;
            }
          }(),
          Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(9999.0),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: valueOrDefault<Color>(
            valueOrDefault<bool>(
              widget.isToday,
              false,
            )
                ? FlutterFlowTheme.of(context).primary
                : Colors.transparent,
            Colors.transparent,
          ),
          width: valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.isToday,
              false,
            )
                ? 1.0
                : 1.0,
            1.0,
          ),
        ),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            valueOrDefault<String>(
              widget.day,
              '25',
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color: valueOrDefault<Color>(
                    valueOrDefault<bool>(
                      widget.isToday,
                      false,
                    )
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).primaryText,
                    FlutterFlowTheme.of(context).primaryText,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
          ),
          if (valueOrDefault<bool>(
            () {
              if (valueOrDefault<String>(
                    widget.status,
                    'none',
                  ) ==
                  'negative') {
                return true;
              } else if (valueOrDefault<String>(
                    widget.status,
                    'none',
                  ) ==
                  'neutral') {
                return true;
              } else if (valueOrDefault<String>(
                    widget.status,
                    'none',
                  ) ==
                  'positive') {
                return true;
              } else {
                return false;
              }
            }(),
            false,
          ))
            Container(
              width: 4.0,
              height: 4.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  () {
                    if (valueOrDefault<String>(
                          widget.status,
                          'none',
                        ) ==
                        'negative') {
                      return FlutterFlowTheme.of(context).error;
                    } else if (valueOrDefault<String>(
                          widget.status,
                          'none',
                        ) ==
                        'neutral') {
                      return FlutterFlowTheme.of(context).warning;
                    } else if (valueOrDefault<String>(
                          widget.status,
                          'none',
                        ) ==
                        'positive') {
                      return FlutterFlowTheme.of(context).success;
                    } else {
                      return Colors.transparent;
                    }
                  }(),
                  Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(9999.0),
                shape: BoxShape.rectangle,
              ),
            ),
        ].divide(SizedBox(height: 2.0)),
      ),
    );
  }
}
