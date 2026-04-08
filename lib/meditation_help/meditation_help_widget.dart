import '/components/meditation_help_comp_widget.dart';
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
import 'meditation_help_model.dart';
export 'meditation_help_model.dart';

class MeditationHelpWidget extends StatefulWidget {
  const MeditationHelpWidget({super.key});

  static String routeName = 'MeditationHelp';
  static String routePath = 'meditationHelp';

  @override
  State<MeditationHelpWidget> createState() => _MeditationHelpWidgetState();
}

class _MeditationHelpWidgetState extends State<MeditationHelpWidget> {
  late MeditationHelpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationHelpModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationHelp'});
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
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: wrapWithModel(
                model: _model.meditationHelpCompModel,
                updateCallback: () => safeSetState(() {}),
                child: MeditationHelpCompWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
