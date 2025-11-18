import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'escape_innerverse_web_view_model.dart';
export 'escape_innerverse_web_view_model.dart';

class EscapeInnerverseWebViewWidget extends StatefulWidget {
  const EscapeInnerverseWebViewWidget({super.key});

  static String routeName = 'EscapeInnerverseWebView';
  static String routePath = 'escapeInnerverseWebView';

  @override
  State<EscapeInnerverseWebViewWidget> createState() =>
      _EscapeInnerverseWebViewWidgetState();
}

class _EscapeInnerverseWebViewWidgetState
    extends State<EscapeInnerverseWebViewWidget> {
  late EscapeInnerverseWebViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscapeInnerverseWebViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EscapeInnerverseWebView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ESCAPE_INNERVERSE_WEB_VIEW_EscapeInnerve');
      logFirebaseEvent('EscapeInnerverseWebView_launch_u_r_l');
      await launchURL('https://ps.escapeapp.ai');
    });

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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 882.93,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
