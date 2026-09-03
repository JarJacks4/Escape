import '/components/button7_widget.dart';
import '/components/instruction_box_widget.dart';
import '/components/movement_preview_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movement_bottom_sheet1_widget.dart' show MovementBottomSheet1Widget;
import 'package:flutter/material.dart';

class MovementBottomSheet1Model
    extends FlutterFlowModel<MovementBottomSheet1Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for MovementPreviewHeader.
  late MovementPreviewHeaderModel movementPreviewHeaderModel;
  // Model for InstructionBox.
  late InstructionBoxModel instructionBoxModel;
  // Model for Button.
  late Button7Model buttonModel;

  @override
  void initState(BuildContext context) {
    movementPreviewHeaderModel =
        createModel(context, () => MovementPreviewHeaderModel());
    instructionBoxModel = createModel(context, () => InstructionBoxModel());
    buttonModel = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    movementPreviewHeaderModel.dispose();
    instructionBoxModel.dispose();
    buttonModel.dispose();
  }
}
