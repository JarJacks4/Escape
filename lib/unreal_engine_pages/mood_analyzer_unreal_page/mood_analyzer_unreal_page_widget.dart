import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mood_analyzer_unreal_page_model.dart';
export 'mood_analyzer_unreal_page_model.dart';

class MoodAnalyzerUnrealPageWidget extends StatefulWidget {
  const MoodAnalyzerUnrealPageWidget({super.key});

  static String routeName = 'MoodAnalyzerUnrealPage';
  static String routePath = 'moodAnalyzerUnrealPage';

  @override
  State<MoodAnalyzerUnrealPageWidget> createState() =>
      _MoodAnalyzerUnrealPageWidgetState();
}

class _MoodAnalyzerUnrealPageWidgetState
    extends State<MoodAnalyzerUnrealPageWidget> {
  late MoodAnalyzerUnrealPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodAnalyzerUnrealPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MoodAnalyzerUnrealPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MOOD_ANALYZER_UNREAL_MoodAnalyzerUnrealP');
      logFirebaseEvent('MoodAnalyzerUnrealPage_request_permissio');
      await requestPermission(cameraPermission);
      logFirebaseEvent('MoodAnalyzerUnrealPage_request_permissio');
      await requestPermission(photoLibraryPermission);
    });
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
      ),
    );
  }
}
