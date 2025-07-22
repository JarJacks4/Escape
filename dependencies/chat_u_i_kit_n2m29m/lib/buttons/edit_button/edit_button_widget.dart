import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_button_model.dart';
export 'edit_button_model.dart';

class EditButtonWidget extends StatefulWidget {
  const EditButtonWidget({
    super.key,
    double? diameter,
    required this.onTap,
  }) : this.diameter = diameter ?? 45.0;

  final double diameter;
  final Future Function()? onTap;

  @override
  State<EditButtonWidget> createState() => _EditButtonWidgetState();
}

class _EditButtonWidgetState extends State<EditButtonWidget> {
  late EditButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Material(
        color: Colors.transparent,
        elevation: 4.0,
        shape: const CircleBorder(),
        child: Container(
          width: valueOrDefault<double>(
            widget!.diameter,
            45.0,
          ),
          height: valueOrDefault<double>(
            widget!.diameter,
            45.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.edit_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
        ),
      ),
    );
  }
}
