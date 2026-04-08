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
import 'sample2_model.dart';
export 'sample2_model.dart';

class Sample2Widget extends StatefulWidget {
  const Sample2Widget({super.key});

  static String routeName = 'sample2';
  static String routePath = 'sample2';

  @override
  State<Sample2Widget> createState() => _Sample2WidgetState();
}

class _Sample2WidgetState extends State<Sample2Widget> {
  late Sample2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Sample2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'sample2'});
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
              height: 874.37,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/bb6a49037631d9bf4053df6b9db07a5b.gif',
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
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          color: Color(0x67D0E3F7),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0x5B27F7CE),
                          Color(0x5AF0831A),
                          Color(0x3F673AB7)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                      border: Border.all(
                        color: Color(0x4CEDF1F7),
                      ),
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
