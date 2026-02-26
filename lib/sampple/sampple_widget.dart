import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'sampple_model.dart';
export 'sampple_model.dart';

class SamppleWidget extends StatefulWidget {
  const SamppleWidget({super.key});

  static String routeName = 'sampple';
  static String routePath = 'sampple';

  @override
  State<SamppleWidget> createState() => _SamppleWidgetState();
}

class _SamppleWidgetState extends State<SamppleWidget> {
  late SamppleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SamppleModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'sampple'});
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
