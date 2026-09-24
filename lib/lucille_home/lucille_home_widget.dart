import '/components/lucille_home_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'lucille_home_model.dart';
export 'lucille_home_model.dart';

class LucilleHomeWidget extends StatefulWidget {
  const LucilleHomeWidget({super.key});

  static String routeName = 'LucilleHome';
  static String routePath = '/lucilleHome';

  @override
  State<LucilleHomeWidget> createState() => _LucilleHomeWidgetState();
}

class _LucilleHomeWidgetState extends State<LucilleHomeWidget> {
  late LucilleHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleHomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LucilleHome'});
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/99b0cab3169105e49b347451207bee7e.gif',
              ).image,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 40.0,
                sigmaY: 40.0,
              ),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x24EDF1F7),
                      Color(0x3CD0E3F7),
                      Color(0x7A1C2444),
                    ],
                    stops: [0.0, 0.5, 1.0],
                    begin: AlignmentDirectional(0.0, -1.0),
                    end: AlignmentDirectional(0.0, 1.0),
                  ),
                ),
                child: wrapWithModel(
                  model: _model.lucilleHomeVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: LucilleHomeVersion5Widget(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
