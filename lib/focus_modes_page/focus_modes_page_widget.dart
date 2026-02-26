import '/components/focus_and_concentration_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'focus_modes_page_model.dart';
export 'focus_modes_page_model.dart';

class FocusModesPageWidget extends StatefulWidget {
  const FocusModesPageWidget({super.key});

  static String routeName = 'FocusModesPage';
  static String routePath = 'focusModesPage';

  @override
  State<FocusModesPageWidget> createState() => _FocusModesPageWidgetState();
}

class _FocusModesPageWidgetState extends State<FocusModesPageWidget> {
  late FocusModesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FocusModesPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FocusModesPage'});
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
              height: 871.68,
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
                model: _model.focusAndConcentrationCompModel,
                updateCallback: () => safeSetState(() {}),
                child: FocusAndConcentrationCompWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
