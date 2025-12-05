import '/components/chat_with_lucille_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/todays_reflection_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'journal_page_f_i_n_a_l_widget.dart' show JournalPageFINALWidget;
import 'package:flutter/material.dart';

class JournalPageFINALModel extends FlutterFlowModel<JournalPageFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [AI Agent - Send Message to Lucille Generate Quote] action in journalPageFINAL widget.
  String? generateQuoteForJournal;
  // Stores action output result for [AI Agent - Send Message to LucilleJournalGeneration] action in journalPageFINAL widget.
  String? journalGeneration;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // Model for TodaysReflectionComp component.
  late TodaysReflectionCompModel todaysReflectionCompModel;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // Model for GenerateSoundscapesCard component.
  late GenerateSoundscapesCardModel generateSoundscapesCardModel;
  // Model for ChatWithLucilleCard component.
  late ChatWithLucilleCardModel chatWithLucilleCardModel;
  // Model for MoodTrackingCard component.
  late MoodTrackingCardModel moodTrackingCardModel;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    todaysReflectionCompModel =
        createModel(context, () => TodaysReflectionCompModel());
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    rowController = ScrollController();
    generateSoundscapesCardModel =
        createModel(context, () => GenerateSoundscapesCardModel());
    chatWithLucilleCardModel =
        createModel(context, () => ChatWithLucilleCardModel());
    moodTrackingCardModel = createModel(context, () => MoodTrackingCardModel());
  }

  @override
  void dispose() {
    columnController1?.dispose();
    todaysReflectionCompModel.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    rowController?.dispose();
    generateSoundscapesCardModel.dispose();
    chatWithLucilleCardModel.dispose();
    moodTrackingCardModel.dispose();
  }

  /// Action blocks.
  Future generateJournalPrompt(BuildContext context) async {}
}
