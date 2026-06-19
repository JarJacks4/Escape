import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tab_item_model.dart';
export 'tab_item_model.dart';

class TabItemWidget extends StatefulWidget {
  const TabItemWidget({
    super.key,
    String? label,
    bool? selected,
  })  : this.label = label ?? 'SlotValue(\$label_1)',
        this.selected = selected ?? true;

  final String label;
  final bool selected;

  @override
  State<TabItemWidget> createState() => _TabItemWidgetState();
}

class _TabItemWidgetState extends State<TabItemWidget> {
  late TabItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          valueOrDefault<bool>(
            widget.selected,
            true,
          )
              ? Color(0x331C2444)
              : Colors.transparent,
          Color(0x331C2444),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.selected,
              true,
            )
                ? 4.0
                : 8.0,
            4.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.selected,
              true,
            )
                ? 4.0
                : 8.0,
            4.0,
          )),
          bottomLeft: Radius.circular(valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.selected,
              true,
            )
                ? 4.0
                : 8.0,
            4.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            valueOrDefault<bool>(
              widget.selected,
              true,
            )
                ? 4.0
                : 8.0,
            4.0,
          )),
        ),
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.transparent,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Container(
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              valueOrDefault<String>(
                widget.label,
                'SlotValue(\$label_1)',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).labelMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      valueOrDefault<bool>(
                        widget.selected,
                        true,
                      )
                          ? Color(0x00000000)
                          : FlutterFlowTheme.of(context).secondaryText,
                      Color(0x00000000),
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
