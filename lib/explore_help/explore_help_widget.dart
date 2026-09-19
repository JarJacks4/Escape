import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'explore_help_model.dart';
export 'explore_help_model.dart';

class ExploreHelpWidget extends StatefulWidget {
  const ExploreHelpWidget({super.key});

  static String routeName = 'ExploreHelp';
  static String routePath = '/exploreHelp';

  @override
  State<ExploreHelpWidget> createState() => _ExploreHelpWidgetState();
}

class _ExploreHelpWidgetState extends State<ExploreHelpWidget> {
  late ExploreHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreHelpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ExploreHelp'});
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
