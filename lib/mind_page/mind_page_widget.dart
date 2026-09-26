import '/components/mind_page_version5_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'mind_page_model.dart';
export 'mind_page_model.dart';

class MindPageWidget extends StatefulWidget {
  const MindPageWidget({super.key});

  static String routeName = 'MindPage';
  static String routePath = '/mindPage';

  @override
  State<MindPageWidget> createState() => _MindPageWidgetState();
}

class _MindPageWidgetState extends State<MindPageWidget> {
  late MindPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MindPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MindPage'});
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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/Create_Tab_Bar_Page_(1).png',
              fit: BoxFit.cover,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/Pi-Slices.gif',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).tertiary,
                    FlutterFlowTheme.of(context).secondary,
                    Color(0x5FEDF1F7),
                    Color(0x80673AB7)
                  ],
                  stops: [0.0, 0.5, 0.75, 1.0],
                  begin: AlignmentDirectional(1.0, 0.87),
                  end: AlignmentDirectional(-1.0, -0.87),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 40.0,
                    sigmaY: 40.0,
                  ),
                  child: wrapWithModel(
                    model: _model.mindPageVersion5CopyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: MindPageVersion5CopyWidget(),
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