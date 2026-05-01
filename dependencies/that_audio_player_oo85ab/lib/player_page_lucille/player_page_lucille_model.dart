import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/music_bottom_sheet_all_tab_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'player_page_lucille_widget.dart' show PlayerPageLucilleWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlayerPageLucilleModel extends FlutterFlowModel<PlayerPageLucilleWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Start Sound)] action in IconButton widget.
  ApiCallResponse? apiResultcqi;
  // Stores action output result for [Backend Call - API (Stop Sound)] action in IconButton widget.
  ApiCallResponse? apiResultt1a;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
