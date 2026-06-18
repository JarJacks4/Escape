import '/components/freud_score_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'freud_score_page_model.dart';
export 'freud_score_page_model.dart';

class FreudScorePageWidget extends StatefulWidget {
  const FreudScorePageWidget({super.key});

  static String routeName = 'FreudScorePage';
  static String routePath = '/freudScorePage';

  @override
  State<FreudScorePageWidget> createState() => _FreudScorePageWidgetState();
}

class _FreudScorePageWidgetState extends State<FreudScorePageWidget> {
  late FreudScorePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FreudScorePageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FreudScorePage'});
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
            children: [
              Container(
                width: double.infinity,
                height: 852.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F0E8),
                ),
                child: wrapWithModel(
                  model: _model.freudScoreModel,
                  updateCallback: () => safeSetState(() {}),
                  child: FreudScoreWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
