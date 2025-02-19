import '/auth/firebase_auth/auth_util.dart';
import '/components/binuaral_beats_card_widget.dart';
import '/components/body_card_widget.dart';
import '/components/breathing_card_copy_widget.dart';
import '/components/meditation_card_widget.dart';
import '/components/nature_card_copy_widget.dart';
import '/components/nature_card_widget.dart';
import '/components/success_home_feedback_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_version2_widget.dart' show HomeVersion2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeVersion2Model extends FlutterFlowModel<HomeVersion2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for MeditationCard component.
  late MeditationCardModel meditationCardModel;
  // Model for BreathingCardCopy component.
  late BreathingCardCopyModel breathingCardCopyModel;
  // Model for NatureCard component.
  late NatureCardModel natureCardModel;
  // Model for BinuaralBeatsCard component.
  late BinuaralBeatsCardModel binuaralBeatsCardModel;
  // Model for BodyCard component.
  late BodyCardModel bodyCardModel;
  // Model for NatureCardCopy component.
  late NatureCardCopyModel natureCardCopyModel;

  @override
  void initState(BuildContext context) {
    meditationCardModel = createModel(context, () => MeditationCardModel());
    breathingCardCopyModel =
        createModel(context, () => BreathingCardCopyModel());
    natureCardModel = createModel(context, () => NatureCardModel());
    binuaralBeatsCardModel =
        createModel(context, () => BinuaralBeatsCardModel());
    bodyCardModel = createModel(context, () => BodyCardModel());
    natureCardCopyModel = createModel(context, () => NatureCardCopyModel());
  }

  @override
  void dispose() {
    meditationCardModel.dispose();
    breathingCardCopyModel.dispose();
    natureCardModel.dispose();
    binuaralBeatsCardModel.dispose();
    bodyCardModel.dispose();
    natureCardCopyModel.dispose();
  }
}
