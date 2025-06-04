import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escape_metaverse_unreal_engine_model.dart';
export 'escape_metaverse_unreal_engine_model.dart';

class EscapeMetaverseUnrealEngineWidget extends StatefulWidget {
  const EscapeMetaverseUnrealEngineWidget({super.key});

  static String routeName = 'EscapeMetaverseUnrealEngine';
  static String routePath = 'escapeMetaverseUnrealEngine';

  @override
  State<EscapeMetaverseUnrealEngineWidget> createState() =>
      _EscapeMetaverseUnrealEngineWidgetState();
}

class _EscapeMetaverseUnrealEngineWidgetState
    extends State<EscapeMetaverseUnrealEngineWidget> {
  late EscapeMetaverseUnrealEngineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscapeMetaverseUnrealEngineModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EscapeMetaverseUnrealEngine'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ESCAPE_METAVERSE_UNREAL_ENGINE_EscapeMet');
      logFirebaseEvent('EscapeMetaverseUnrealEngine_request_perm');
      await requestPermission(cameraPermission);
    });
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
      ),
    );
  }
}
