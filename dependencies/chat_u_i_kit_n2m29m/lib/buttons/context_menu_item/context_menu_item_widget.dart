import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'context_menu_item_model.dart';
export 'context_menu_item_model.dart';

class ContextMenuItemWidget extends StatefulWidget {
  const ContextMenuItemWidget({
    super.key,
    required this.icon,
    required this.label,
    Color? textColor,
    required this.onTap,
    bool? isFirst,
    bool? isLast,
    this.textSize,
  })  : this.textColor = textColor ?? const Color(0xFF070A0D),
        this.isFirst = isFirst ?? false,
        this.isLast = isLast ?? false;

  final Widget? icon;
  final String? label;
  final Color textColor;
  final Future Function()? onTap;
  final bool isFirst;
  final bool isLast;
  final double? textSize;

  @override
  State<ContextMenuItemWidget> createState() => _ContextMenuItemWidgetState();
}

class _ContextMenuItemWidgetState extends State<ContextMenuItemWidget> {
  late ContextMenuItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContextMenuItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(valueOrDefault<double>(
            widget!.isLast ? 10.0 : 0.0,
            0.0,
          )),
          bottomRight: Radius.circular(valueOrDefault<double>(
            widget!.isLast ? 10.0 : 0.0,
            0.0,
          )),
          topLeft: Radius.circular(valueOrDefault<double>(
            widget!.isFirst ? 10.0 : 0.0,
            0.0,
          )),
          topRight: Radius.circular(valueOrDefault<double>(
            widget!.isFirst ? 10.0 : 0.0,
            0.0,
          )),
        ),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            12.0,
            valueOrDefault<double>(
              utility_functions_library_8g4bud_app_constant
                  .FFAppConstants.padding8,
              0.0,
            ),
            12.0,
            valueOrDefault<double>(
              utility_functions_library_8g4bud_app_constant
                  .FFAppConstants.padding8,
              0.0,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            widget!.icon!,
            Text(
              valueOrDefault<String>(
                widget!.label,
                '[label]',
              ),
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                    ),
                    color: valueOrDefault<Color>(
                      widget!.textColor,
                      FlutterFlowTheme.of(context).secondaryText,
                    ),
                    fontSize: valueOrDefault<double>(
                      widget!.textSize,
                      14.0,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
