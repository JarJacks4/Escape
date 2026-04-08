import '/components/choose_your_realm_version5_widget.dart';
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
import 'choose_your_realm_version5_page_model.dart';
export 'choose_your_realm_version5_page_model.dart';

class ChooseYourRealmVersion5PageWidget extends StatefulWidget {
  const ChooseYourRealmVersion5PageWidget({super.key});

  static String routeName = 'ChooseYourRealmVersion5Page';
  static String routePath = 'chooseYourRealmVersion5Page';

  @override
  State<ChooseYourRealmVersion5PageWidget> createState() =>
      _ChooseYourRealmVersion5PageWidgetState();
}

class _ChooseYourRealmVersion5PageWidgetState
    extends State<ChooseYourRealmVersion5PageWidget> {
  late ChooseYourRealmVersion5PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseYourRealmVersion5PageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChooseYourRealmVersion5Page'});
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
                height: 872.8,
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
                  model: _model.chooseYourRealmVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: ChooseYourRealmVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
