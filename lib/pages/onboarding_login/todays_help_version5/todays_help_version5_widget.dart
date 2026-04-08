import '/components/todays_help_version5_comp_widget.dart';
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
import 'todays_help_version5_model.dart';
export 'todays_help_version5_model.dart';

class TodaysHelpVersion5Widget extends StatefulWidget {
  const TodaysHelpVersion5Widget({super.key});

  static String routeName = 'TodaysHelpVersion5';
  static String routePath = 'todaysHelpVersion5';

  @override
  State<TodaysHelpVersion5Widget> createState() =>
      _TodaysHelpVersion5WidgetState();
}

class _TodaysHelpVersion5WidgetState extends State<TodaysHelpVersion5Widget> {
  late TodaysHelpVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TodaysHelpVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TodaysHelpVersion5'});
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30.0,
                      sigmaY: 30.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x2FEDF1F7),
                            Color(0x4DD0E3F7),
                            Color(0x3A2196F3),
                            Color(0x7E673AB7)
                          ],
                          stops: [0.0, 0.5, 0.75, 1.0],
                          begin: AlignmentDirectional(1.0, -0.64),
                          end: AlignmentDirectional(-1.0, 0.64),
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: wrapWithModel(
                        model: _model.todaysHelpVersion5CompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TodaysHelpVersion5CompWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
