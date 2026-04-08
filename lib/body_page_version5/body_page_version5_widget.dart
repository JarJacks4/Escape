import '/components/body_page_widget.dart';
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
import 'body_page_version5_model.dart';
export 'body_page_version5_model.dart';

class BodyPageVersion5Widget extends StatefulWidget {
  const BodyPageVersion5Widget({super.key});

  static String routeName = 'BodyPageVersion5';
  static String routePath = 'bodyPageVersion5';

  @override
  State<BodyPageVersion5Widget> createState() => _BodyPageVersion5WidgetState();
}

class _BodyPageVersion5WidgetState extends State<BodyPageVersion5Widget> {
  late BodyPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodyPageVersion5'});
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
              height: 877.78,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/GIF_from_GIFER.gif',
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
                          Color(0x29F4EDF7),
                          Color(0x3FF522DF),
                          Color(0x885336EA)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.bodyPageModel,
                      updateCallback: () => safeSetState(() {}),
                      child: BodyPageWidget(),
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
