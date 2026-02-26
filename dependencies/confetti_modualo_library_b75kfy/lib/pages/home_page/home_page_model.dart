import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'home_page_widget.dart' show HomePageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SelectedShape widget.
  FormFieldController<List<String>>? selectedShapeValueController;
  String? get selectedShapeValue =>
      selectedShapeValueController?.value?.firstOrNull;
  set selectedShapeValue(String? val) =>
      selectedShapeValueController?.value = val != null ? [val] : [];
  // State field(s) for displaySource widget.
  bool? displaySourceValue;
  // State field(s) for loopAnimation widget.
  bool? loopAnimationValue;
  // State field(s) for directional widget.
  bool? directionalValue;
  // State field(s) for degree widget.
  double? degreeValue;
  // State field(s) for duration widget.
  double? durationValue;
  // State field(s) for gravity widget.
  double? gravityValue;
  // State field(s) for numberofparticles widget.
  double? numberofparticlesValue;
  // State field(s) for emissionfrequency widget.
  double? emissionfrequencyValue;
  // State field(s) for particleDrag widget.
  double? particleDragValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
