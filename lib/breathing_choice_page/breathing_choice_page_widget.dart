import '/components/breathing_choice_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'breathing_choice_page_model.dart';
export 'breathing_choice_page_model.dart';

class BreathingChoicePageWidget extends StatefulWidget {
  const BreathingChoicePageWidget({super.key});

  static String routeName = 'BreathingChoicePage';
  static String routePath = 'breathingChoicePage';

  @override
  State<BreathingChoicePageWidget> createState() =>
      _BreathingChoicePageWidgetState();
}

class _BreathingChoicePageWidgetState extends State<BreathingChoicePageWidget> {
  late BreathingChoicePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreathingChoicePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BreathingChoicePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.breathingChoiceCompModel,
            updateCallback: () => safeSetState(() {}),
            child: BreathingChoiceCompWidget(),
          ),
        ),
      ),
    );
  }
}
