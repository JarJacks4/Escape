import '/components/destination_details_unreal_engine_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'destination_details_unreal_engine_version5_widget.dart'
    show DestinationDetailsUnrealEngineVersion5Widget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DestinationDetailsUnrealEngineVersion5Model
    extends FlutterFlowModel<DestinationDetailsUnrealEngineVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for DestinationDetailsUnrealEngine component.
  late DestinationDetailsUnrealEngineModel destinationDetailsUnrealEngineModel;

  @override
  void initState(BuildContext context) {
    destinationDetailsUnrealEngineModel =
        createModel(context, () => DestinationDetailsUnrealEngineModel());
  }

  @override
  void dispose() {
    destinationDetailsUnrealEngineModel.dispose();
  }
}
