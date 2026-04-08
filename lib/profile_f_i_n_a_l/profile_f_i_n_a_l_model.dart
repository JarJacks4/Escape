import '/components/profile_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'profile_f_i_n_a_l_widget.dart' show ProfileFINALWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileFINALModel extends FlutterFlowModel<ProfileFINALWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // Model for ProfilePageVersion5 component.
  late ProfilePageVersion5Model profilePageVersion5Model;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    profilePageVersion5Model =
        createModel(context, () => ProfilePageVersion5Model());
  }

  @override
  void dispose() {
    columnController?.dispose();
    profilePageVersion5Model.dispose();
  }
}
