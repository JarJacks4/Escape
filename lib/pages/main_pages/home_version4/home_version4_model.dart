import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/todays_self_care_activities_comp_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_version4_widget.dart' show HomeVersion4Widget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';

class HomeVersion4Model extends FlutterFlowModel<HomeVersion4Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Lucille Chat)] action in HomeVersion4 widget.
  ApiCallResponse? generateQuote;
  // Stores action output result for [Backend Call - API (CreateSession)] action in HomeVersion4 widget.
  ApiCallResponse? createHomeSession;
  // Stores action output result for [Backend Call - API (Lucille Chat)] action in HomeVersion4 widget.
  ApiCallResponse? generateQuoteIfFail;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 900;
  int timerMilliseconds = 900;
  String timerValue = StopWatchTimer.getDisplayTime(
    900,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Model for TodaysSelfCareActivitiesComp component.
  late TodaysSelfCareActivitiesCompModel todaysSelfCareActivitiesCompModel;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    todaysSelfCareActivitiesCompModel =
        createModel(context, () => TodaysSelfCareActivitiesCompModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    todaysSelfCareActivitiesCompModel.dispose();
  }

  /// Action blocks.
  Future homePageStartupActions(BuildContext context) async {
    String? lucilleGenerateQuote;

    logFirebaseEvent('HomePageStartupActions_update_app_state');
    FFAppState().GoalsCompleted = FFAppState().GoalsCompleted + 1;
    FFAppState().hasCompletedGoal = !(FFAppState().hasCompletedGoal ?? true);
    FFAppState().update(() {});
    logFirebaseEvent('HomePageStartupActions_backend_call');

    await currentUserReference!.update(createUsersRecordData(
      isActive: true,
    ));
    logFirebaseEvent('HomePageStartupActions_a_i_agent');
    await callAiAgent(
      context: context,
      prompt: 'Generate a quote about self care that is 200 characters please!',
      threadId: '1',
      agentCloudFunctionName: 'lucilleGenerateQuote',
      provider: 'GOOGLE',
      agentJson:
          '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lucilleGenerateQuote\",\"key\":\"fgsej\"},\"name\":\"Lucille Generate Quote\",\"description\":\"This is a AI Agent named Lucille for Escape that helps generate a quote for the user based on their current mood.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Generate a text a 200 characterl quote from a real person that uplifts the user and is based off of the user\'s {CurrentMood}: \\n\\nCurrentMood\"},{\"role\":\"USER\",\"text\":\"Could you help me generate a 200 character quote from a real person that uplifts the user and is based off of the user\'s {CurrentMood}: \\n\\nCurrentMood\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
      responseType: 'PLAINTEXT',
    ).then((generatedText) {
      lucilleGenerateQuote = generatedText;
    });

    logFirebaseEvent('HomePageStartupActions_show_snack_bar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Quote Available!',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
  }
}
