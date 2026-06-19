import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mood_breakdown_item_model.dart';
export 'mood_breakdown_item_model.dart';

class MoodBreakdownItemWidget extends StatefulWidget {
  const MoodBreakdownItemWidget({
    super.key,
    Color? color,
    String? dotId,
    String? label,
    String? labelId,
    String? rowId,
    String? value,
    String? valueId,
  })  : this.color = color ?? const Color(0xFFFCC462),
        this.dotId = dotId ?? 'd1',
        this.label = label ?? 'Happy',
        this.labelId = labelId ?? 'l1',
        this.rowId = rowId ?? 'm1',
        this.value = value ?? '45%',
        this.valueId = valueId ?? 'v1';

  final Color color;
  final String dotId;
  final String label;
  final String labelId;
  final String rowId;
  final String value;
  final String valueId;

  @override
  State<MoodBreakdownItemWidget> createState() =>
      _MoodBreakdownItemWidgetState();
}

class _MoodBreakdownItemWidgetState extends State<MoodBreakdownItemWidget> {
  late MoodBreakdownItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodBreakdownItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Row(
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
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  color: valueOrDefault<Color>(
                    widget.color,
                    Color(0xFFFCC462),
                  ),
                  borderRadius: BorderRadius.circular(9999.0),
                  shape: BoxShape.rectangle,
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.label,
                  'Happy',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
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
            ].divide(SizedBox(width: 16.0)),
          ),
          Text(
            valueOrDefault<String>(
              widget.value,
              '45%',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}
