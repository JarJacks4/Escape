import '/components/begin_session_widget.dart';
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
import 'begin_session_page_model.dart';
export 'begin_session_page_model.dart';

class BeginSessionPageWidget extends StatefulWidget {
  const BeginSessionPageWidget({super.key});

  static String routeName = 'BeginSessionPage';
  static String routePath = 'beginSessionPage';

  @override
  State<BeginSessionPageWidget> createState() => _BeginSessionPageWidgetState();
}

class _BeginSessionPageWidgetState extends State<BeginSessionPageWidget> {
  late BeginSessionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginSessionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BeginSessionPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 872.3,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
                  ).image,
                ),
              ),
              child: wrapWithModel(
                model: _model.beginSessionModel,
                updateCallback: () => safeSetState(() {}),
                child: BeginSessionWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
