import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'mind_help_model.dart';
export 'mind_help_model.dart';

class MindHelpWidget extends StatefulWidget {
  const MindHelpWidget({super.key});

  static String routeName = 'MindHelp';
  static String routePath = '/mindHelp';

  @override
  State<MindHelpWidget> createState() => _MindHelpWidgetState();
}

class _MindHelpWidgetState extends State<MindHelpWidget> {
  late MindHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindHelpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MindHelp'});
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
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.meditationHelpCompModel,
                updateCallback: () => safeSetState(() {}),
                child: MeditationHelpCompWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
