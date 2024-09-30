import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headers/header_yoga/header_yoga_widget.dart';
import '/meditation_and_sounds/tabbar_home_yoga/tabbar_home_yoga_widget.dart';
import 'dart:math';
import 'body_home_widget.dart' show BodyHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BodyHomeModel extends FlutterFlowModel<BodyHomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeaderYoga component.
  late HeaderYogaModel headerYogaModel;
  // Model for tabbarHomeYoga component.
  late TabbarHomeYogaModel tabbarHomeYogaModel;

  @override
  void initState(BuildContext context) {
    headerYogaModel = createModel(context, () => HeaderYogaModel());
    tabbarHomeYogaModel = createModel(context, () => TabbarHomeYogaModel());
  }

  @override
  void dispose() {
    headerYogaModel.dispose();
    tabbarHomeYogaModel.dispose();
  }
}
