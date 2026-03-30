import '/components/respiration_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'respiration_page_model.dart';
export 'respiration_page_model.dart';

class RespirationPageWidget extends StatefulWidget {
  const RespirationPageWidget({super.key});

  static String routeName = 'RespirationPage';
  static String routePath = 'respirationPage';

  @override
  State<RespirationPageWidget> createState() => _RespirationPageWidgetState();
}

class _RespirationPageWidgetState extends State<RespirationPageWidget> {
  late RespirationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RespirationPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'RespirationPage'});
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
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 852.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.respirationComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: RespirationComponentWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
