import '/components/body_page_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'body_page_version5_model.dart';
export 'body_page_version5_model.dart';

class BodyPageVersion5Widget extends StatefulWidget {
  const BodyPageVersion5Widget({super.key});

  static String routeName = 'BodyPageVersion5';
  static String routePath = '/bodyPageVersion5';

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
                    'assets/images/d8b3cd809cf65ca8c4e3fb8c4a110b8f.gif',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x89EDF1F7),
                          Color(0x8EF1B3EB),
                          Color(0x8EFCC462)
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
