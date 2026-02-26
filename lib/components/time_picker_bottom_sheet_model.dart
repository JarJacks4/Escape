import '/components/time_picker_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'time_picker_bottom_sheet_widget.dart' show TimePickerBottomSheetWidget;
import 'package:flutter/material.dart';

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
