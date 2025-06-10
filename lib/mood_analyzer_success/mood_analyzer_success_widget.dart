import '/components/mood_analyzer_success_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_analyzer_success_model.dart';
export 'mood_analyzer_success_model.dart';

class MoodAnalyzerSuccessWidget extends StatefulWidget {
  const MoodAnalyzerSuccessWidget({super.key});

  static String routeName = 'MoodAnalyzerSuccess';
  static String routePath = 'moodAnalyzerSuccess';

  @override
  State<MoodAnalyzerSuccessWidget> createState() =>
      _MoodAnalyzerSuccessWidgetState();
}

class _MoodAnalyzerSuccessWidgetState extends State<MoodAnalyzerSuccessWidget> {
  late MoodAnalyzerSuccessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodAnalyzerSuccessModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodAnalyzerSuccess'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: wrapWithModel(
          model: _model.moodAnalyzerSuccessCompModel,
          updateCallback: () => safeSetState(() {}),
          child: MoodAnalyzerSuccessCompWidget(),
        ),
      ),
    );
  }
}
