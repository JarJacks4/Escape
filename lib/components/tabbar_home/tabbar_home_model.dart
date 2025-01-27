import '/components/meditation_sounds_list/meditation_sounds_list_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'tabbar_home_widget.dart' show TabbarHomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabbarHomeModel extends FlutterFlowModel<TabbarHomeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for MeditationSoundsList component.
  late MeditationSoundsListModel meditationSoundsListModel;

  @override
  void initState(BuildContext context) {
    meditationSoundsListModel =
        createModel(context, () => MeditationSoundsListModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    meditationSoundsListModel.dispose();
  }
}
