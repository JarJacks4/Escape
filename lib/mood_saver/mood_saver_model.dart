import '/components/balance_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mood_saver_widget.dart' show MoodSaverWidget;
import 'package:flutter/material.dart';

class MoodSaverModel extends FlutterFlowModel<MoodSaverWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for balancePage component.
  late BalancePageModel balancePageModel;

  @override
  void initState(BuildContext context) {
    balancePageModel = createModel(context, () => BalancePageModel());
  }

  @override
  void dispose() {
    balancePageModel.dispose();
  }
}
