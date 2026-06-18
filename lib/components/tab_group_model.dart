import '/components/tab_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tab_group_widget.dart' show TabGroupWidget;
import 'package:flutter/material.dart';

class TabGroupModel extends FlutterFlowModel<TabGroupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TabItem.
  late TabItemModel tabItemModel1;
  // Model for TabItem.
  late TabItemModel tabItemModel2;
  // Model for TabItem.
  late TabItemModel tabItemModel3;
  // Model for TabItem.
  late TabItemModel tabItemModel4;
  // Model for TabItem.
  late TabItemModel tabItemModel5;

  @override
  void initState(BuildContext context) {
    tabItemModel1 = createModel(context, () => TabItemModel());
    tabItemModel2 = createModel(context, () => TabItemModel());
    tabItemModel3 = createModel(context, () => TabItemModel());
    tabItemModel4 = createModel(context, () => TabItemModel());
    tabItemModel5 = createModel(context, () => TabItemModel());
  }

  @override
  void dispose() {
    tabItemModel1.dispose();
    tabItemModel2.dispose();
    tabItemModel3.dispose();
    tabItemModel4.dispose();
    tabItemModel5.dispose();
  }
}
