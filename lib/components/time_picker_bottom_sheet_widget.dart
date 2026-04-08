import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'time_picker_bottom_sheet_model.dart';
export 'time_picker_bottom_sheet_model.dart';

class TimePickerBottomSheetWidget extends StatefulWidget {
  const TimePickerBottomSheetWidget({super.key});

  @override
  State<TimePickerBottomSheetWidget> createState() =>
      _TimePickerBottomSheetWidgetState();
}

class _TimePickerBottomSheetWidgetState
    extends State<TimePickerBottomSheetWidget> {
  late TimePickerBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimePickerBottomSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 328.38,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.timePickerBottomSheetModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: TimePickerBottomSheetWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
