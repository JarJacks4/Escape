import '/components/reset_version5_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reset_page_model.dart';
export 'reset_page_model.dart';

class ResetPageWidget extends StatefulWidget {
  const ResetPageWidget({super.key});

  static String routeName = 'ResetPage';
  static String routePath = 'resetPage';

  @override
  State<ResetPageWidget> createState() => _ResetPageWidgetState();
}

class _ResetPageWidgetState extends State<ResetPageWidget> {
  late ResetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResetPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ResetPage'});
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 872.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Reset_All_Tab_(1).png',
                    ).image,
                  ),
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
                  model: _model.resetVersion5CopyModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ResetVersion5CopyWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
