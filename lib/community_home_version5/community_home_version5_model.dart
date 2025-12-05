import '/flutter_flow/flutter_flow_util.dart';
import 'community_home_version5_widget.dart' show CommunityHomeVersion5Widget;
import 'package:flutter/material.dart';

class CommunityHomeVersion5Model
    extends FlutterFlowModel<CommunityHomeVersion5Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Stores action output result for [Custom Action - reorderItems] action in ListView widget.
  List<String>? reorderMeditation;
  // State field(s) for Column widget.
  ScrollController? columnController2;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
  }
}
