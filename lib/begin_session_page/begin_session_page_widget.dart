import '/components/begin_session_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'begin_session_page_model.dart';
export 'begin_session_page_model.dart';

class BeginSessionPageWidget extends StatefulWidget {
  const BeginSessionPageWidget({
    super.key,
    this.currentIndex,
  });

  final int? currentIndex;

  static String routeName = 'BeginSessionPage';
  static String routePath = '/beginSessionPage';

  @override
  State<BeginSessionPageWidget> createState() => _BeginSessionPageWidgetState();
}

class _BeginSessionPageWidgetState extends State<BeginSessionPageWidget> {
  late BeginSessionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginSessionPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BeginSessionPage'});
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
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/fdc4eed9423862348bcc86e35c0c78d0.gif',
              fit: BoxFit.cover,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5.0,
                  sigmaY: 5.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x22EDF1F7),
                        Color(0x4F1C2444),
                        Color(0xFFB10BE8)
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: wrapWithModel(
                    model: _model.beginSessionModel,
                    updateCallback: () => safeSetState(() {}),
                    child: BeginSessionWidget(
                      currentIndex: widget.currentIndex,
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
