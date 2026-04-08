import '/components/profile_page_version5_widget.dart';
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
import 'profile_f_i_n_a_l_model.dart';
export 'profile_f_i_n_a_l_model.dart';

class ProfileFINALWidget extends StatefulWidget {
  const ProfileFINALWidget({super.key});

  static String routeName = 'profileFINAL';
  static String routePath = 'profileFINAL';

  @override
  State<ProfileFINALWidget> createState() => _ProfileFINALWidgetState();
}

class _ProfileFINALWidgetState extends State<ProfileFINALWidget> {
  late ProfileFINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileFINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profileFINAL'});
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
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: _model.columnController,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.profilePageVersion5Model,
                      updateCallback: () => safeSetState(() {}),
                      child: ProfilePageVersion5Widget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
