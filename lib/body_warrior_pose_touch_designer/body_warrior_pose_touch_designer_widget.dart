import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'body_warrior_pose_touch_designer_model.dart';
export 'body_warrior_pose_touch_designer_model.dart';

class BodyWarriorPoseTouchDesignerWidget extends StatefulWidget {
  const BodyWarriorPoseTouchDesignerWidget({super.key});

  static String routeName = 'BodyWarriorPoseTouchDesigner';
  static String routePath = '/bodyWarriorPoseTouchDesigner';

  @override
  State<BodyWarriorPoseTouchDesignerWidget> createState() =>
      _BodyWarriorPoseTouchDesignerWidgetState();
}

class _BodyWarriorPoseTouchDesignerWidgetState
    extends State<BodyWarriorPoseTouchDesignerWidget> {
  late BodyWarriorPoseTouchDesignerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BodyWarriorPoseTouchDesignerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BodyWarriorPoseTouchDesigner'});
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
              height: 874.73,
              decoration: BoxDecoration(),
              child: FlutterFlowWebView(
                content: 'https://flutter.dev',
                bypass: true,
                height: MediaQuery.sizeOf(context).height * 1.0,
                verticalScroll: true,
                horizontalScroll: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
