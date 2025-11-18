import '/components/destination_details_unreal_engine_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'destination_details_unreal_engine_version5_widget.dart'
    show DestinationDetailsUnrealEngineVersion5Widget;
import 'package:flutter/material.dart';

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
