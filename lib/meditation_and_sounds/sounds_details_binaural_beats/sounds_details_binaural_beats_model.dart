import '/components/binauralbeats_details_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'sounds_details_binaural_beats_widget.dart'
    show SoundsDetailsBinauralBeatsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SoundsDetailsBinauralBeatsModel
    extends FlutterFlowModel<SoundsDetailsBinauralBeatsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BinauralbeatsDetails component.
  late BinauralbeatsDetailsModel binauralbeatsDetailsModel;

  @override
  void initState(BuildContext context) {
    binauralbeatsDetailsModel =
        createModel(context, () => BinauralbeatsDetailsModel());
  }

  @override
  void dispose() {
    binauralbeatsDetailsModel.dispose();
  }
}
