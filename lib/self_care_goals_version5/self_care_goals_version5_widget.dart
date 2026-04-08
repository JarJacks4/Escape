import '/components/set_goals_comp_widget.dart';
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
import 'self_care_goals_version5_model.dart';
export 'self_care_goals_version5_model.dart';

class SelfCareGoalsVersion5Widget extends StatefulWidget {
  const SelfCareGoalsVersion5Widget({super.key});

  static String routeName = 'SelfCareGoalsVersion5';
  static String routePath = 'selfCareGoalsVersion5';

  @override
  State<SelfCareGoalsVersion5Widget> createState() =>
      _SelfCareGoalsVersion5WidgetState();
}

class _SelfCareGoalsVersion5WidgetState
    extends State<SelfCareGoalsVersion5Widget> {
  late SelfCareGoalsVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelfCareGoalsVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SelfCareGoalsVersion5'});
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
              height: 909.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/9c1b5219f5cd92286d0785010da2ecea.gif',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 80.0,
                    sigmaY: 80.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x2D39519F),
                          Color(0x58D0E3F7),
                          Color(0x80673AB7)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.setGoalsCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: SetGoalsCompWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
