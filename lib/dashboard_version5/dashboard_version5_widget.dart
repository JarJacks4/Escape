import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'dashboard_version5_model.dart';
export 'dashboard_version5_model.dart';

class DashboardVersion5Widget extends StatefulWidget {
  const DashboardVersion5Widget({super.key});

  static String routeName = 'DashboardVersion5';
  static String routePath = '/dashboardVersion5';

  @override
  State<DashboardVersion5Widget> createState() =>
      _DashboardVersion5WidgetState();
}

class _DashboardVersion5WidgetState extends State<DashboardVersion5Widget> {
  late DashboardVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DashboardVersion5'});
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
