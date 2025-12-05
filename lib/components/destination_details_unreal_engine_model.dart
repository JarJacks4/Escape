import '/flutter_flow/flutter_flow_util.dart';
import 'destination_details_unreal_engine_widget.dart'
    show DestinationDetailsUnrealEngineWidget;
import 'package:flutter/material.dart';

class DestinationDetailsUnrealEngineModel
    extends FlutterFlowModel<DestinationDetailsUnrealEngineWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
  }
}
