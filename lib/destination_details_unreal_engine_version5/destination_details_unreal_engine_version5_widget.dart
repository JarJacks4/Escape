import '/components/destination_details_unreal_engine_widget.dart';
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
import 'destination_details_unreal_engine_version5_model.dart';
export 'destination_details_unreal_engine_version5_model.dart';

class DestinationDetailsUnrealEngineVersion5Widget extends StatefulWidget {
  const DestinationDetailsUnrealEngineVersion5Widget({super.key});

  static String routeName = 'DestinationDetailsUnrealEngineVersion5';
  static String routePath = 'destinationDetailsUnrealEngineVersion5';

  @override
  State<DestinationDetailsUnrealEngineVersion5Widget> createState() =>
      _DestinationDetailsUnrealEngineVersion5WidgetState();
}

class _DestinationDetailsUnrealEngineVersion5WidgetState
    extends State<DestinationDetailsUnrealEngineVersion5Widget> {
  late DestinationDetailsUnrealEngineVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => DestinationDetailsUnrealEngineVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'DestinationDetailsUnrealEngineVersion5'});
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
              height: 876.0,
              decoration: BoxDecoration(),
              child: wrapWithModel(
                model: _model.destinationDetailsUnrealEngineModel,
                updateCallback: () => safeSetState(() {}),
                child: DestinationDetailsUnrealEngineWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
