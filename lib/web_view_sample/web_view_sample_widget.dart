import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'web_view_sample_model.dart';
export 'web_view_sample_model.dart';

class WebViewSampleWidget extends StatefulWidget {
  const WebViewSampleWidget({super.key});

  static String routeName = 'WebViewSample';
  static String routePath = '/webViewSample';

  @override
  State<WebViewSampleWidget> createState() => _WebViewSampleWidgetState();
}

class _WebViewSampleWidgetState extends State<WebViewSampleWidget> {
  late WebViewSampleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebViewSampleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WebViewSample'});
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
              height: 878.73,
              decoration: BoxDecoration(),
              child: FlutterFlowWebView(
                content: 'https://flutter.dev',
                bypass: false,
                height: 500.0,
                verticalScroll: false,
                horizontalScroll: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
