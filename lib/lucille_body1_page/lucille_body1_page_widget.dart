import '/components/lucille_body1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'lucille_body1_page_model.dart';
export 'lucille_body1_page_model.dart';

class LucilleBody1PageWidget extends StatefulWidget {
  const LucilleBody1PageWidget({super.key});

  static String routeName = 'LucilleBody1Page';
  static String routePath = 'lucilleBody1Page';

  @override
  State<LucilleBody1PageWidget> createState() => _LucilleBody1PageWidgetState();
}

class _LucilleBody1PageWidgetState extends State<LucilleBody1PageWidget> {
  late LucilleBody1PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleBody1PageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleBody1Page'});
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
            Container(
              width: double.infinity,
              height: 874.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: wrapWithModel(
                model: _model.lucilleBody1Model,
                updateCallback: () => safeSetState(() {}),
                child: LucilleBody1Widget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
