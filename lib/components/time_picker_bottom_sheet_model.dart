import '/components/time_picker_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'time_picker_bottom_sheet_widget.dart' show TimePickerBottomSheetWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TimePickerBottomSheetModel
    extends FlutterFlowModel<TimePickerBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TimePickerBottomSheet component.
  TimePickerBottomSheetModel? _timePickerBottomSheetModel;
  TimePickerBottomSheetModel get timePickerBottomSheetModel =>
      _timePickerBottomSheetModel ??= TimePickerBottomSheetModel();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timePickerBottomSheetModel.dispose();
  }
}
