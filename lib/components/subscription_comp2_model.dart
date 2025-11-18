import '/flutter_flow/flutter_flow_util.dart';
import 'subscription_comp2_widget.dart' show SubscriptionComp2Widget;
import 'package:flutter/material.dart';

class SubscriptionComp2Model extends FlutterFlowModel<SubscriptionComp2Widget> {
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
