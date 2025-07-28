import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_c_t_a_model.dart';
export 'button_c_t_a_model.dart';

class ButtonCTAWidget extends StatefulWidget {
  const ButtonCTAWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String? text;
  final Future Function()? onTap;

  @override
  State<ButtonCTAWidget> createState() => _ButtonCTAWidgetState();
}

class _ButtonCTAWidgetState extends State<ButtonCTAWidget> {
  late ButtonCTAModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonCTAModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.onTap?.call();
      },
      text: widget!.text!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.inter(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: Colors.white,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderRadius: BorderRadius.circular(26.0),
      ),
    );
  }
}
