import '/components/quest_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quests_page_widget.dart' show QuestsPageWidget;
import 'package:flutter/material.dart';

class QuestsPageModel extends FlutterFlowModel<QuestsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for QuestCompVersion5 component.
  late QuestCompVersion5Model questCompVersion5Model;

  @override
  void initState(BuildContext context) {
    questCompVersion5Model =
        createModel(context, () => QuestCompVersion5Model());
  }

  @override
  void dispose() {
    questCompVersion5Model.dispose();
  }
}
