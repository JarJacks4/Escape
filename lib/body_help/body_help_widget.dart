import '/components/meditation_help_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'body_help_model.dart';
export 'body_help_model.dart';

class BodyHelpWidget extends StatefulWidget {
  const BodyHelpWidget({super.key});

  static String routeName = 'BodyHelp';
  static String routePath = '/bodyHelp';

  @override
  State<BodyHelpWidget> createState() => _BodyHelpWidgetState();
}

class _BodyHelpWidgetState extends State<BodyHelpWidget> {
  late BodyHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyHelpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BodyHelp'});
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
