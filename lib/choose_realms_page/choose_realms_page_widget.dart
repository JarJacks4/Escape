import '/components/choose_realms_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'choose_realms_page_model.dart';
export 'choose_realms_page_model.dart';

class ChooseRealmsPageWidget extends StatefulWidget {
  const ChooseRealmsPageWidget({super.key});

  static String routeName = 'ChooseRealmsPage';
  static String routePath = 'chooseRealmsPage';

  @override
  State<ChooseRealmsPageWidget> createState() => _ChooseRealmsPageWidgetState();
}

class _ChooseRealmsPageWidgetState extends State<ChooseRealmsPageWidget> {
  late ChooseRealmsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseRealmsPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChooseRealmsPage'});
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
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      FlutterFlowTheme.of(context).secondary
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0, 1.0),
                  ),
                ),
                child: wrapWithModel(
                  model: _model.chooseRealmsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ChooseRealmsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
