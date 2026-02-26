import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'test_page1_model.dart';
export 'test_page1_model.dart';

class TestPage1Widget extends StatefulWidget {
  const TestPage1Widget({super.key});

  static String routeName = 'test_page1';
  static String routePath = 'testPage1';

  @override
  State<TestPage1Widget> createState() => _TestPage1WidgetState();
}

class _TestPage1WidgetState extends State<TestPage1Widget> {
  late TestPage1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPage1Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'test_page1'});
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
