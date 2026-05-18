import '/components/coming_soon_body_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'coming_soon_body_model.dart';
export 'coming_soon_body_model.dart';

class ComingSoonBodyWidget extends StatefulWidget {
  const ComingSoonBodyWidget({super.key});

  static String routeName = 'ComingSoonBody';
  static String routePath = '/comingSoonBody';

  @override
  State<ComingSoonBodyWidget> createState() => _ComingSoonBodyWidgetState();
}

class _ComingSoonBodyWidgetState extends State<ComingSoonBodyWidget> {
  late ComingSoonBodyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComingSoonBodyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ComingSoonBody'});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.comingSoonBodyCompModel,
              updateCallback: () => safeSetState(() {}),
              child: ComingSoonBodyCompWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
