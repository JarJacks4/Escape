import '/components/energy_centers_guide_comp_widget.dart';
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
import 'energy_centers_guidance_model.dart';
export 'energy_centers_guidance_model.dart';

class EnergyCentersGuidanceWidget extends StatefulWidget {
  const EnergyCentersGuidanceWidget({super.key});

  static String routeName = 'EnergyCentersGuidance';
  static String routePath = 'energyCentersGuidance';

  @override
  State<EnergyCentersGuidanceWidget> createState() =>
      _EnergyCentersGuidanceWidgetState();
}

class _EnergyCentersGuidanceWidgetState
    extends State<EnergyCentersGuidanceWidget> {
  late EnergyCentersGuidanceModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnergyCentersGuidanceModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'EnergyCentersGuidance'});
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 884.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                    ).image,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 80.0,
                      sigmaY: 80.0,
                    ),
                    child: Container(
                      width: 100.0,
                      height: 155.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x2C39519F),
                            Color(0x5354DBFE),
                            Color(0x8AEDF1F7)
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(1.0, -0.64),
                          end: AlignmentDirectional(-1.0, 0.64),
                        ),
                      ),
                      child: wrapWithModel(
                        model: _model.energyCentersGuideCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: EnergyCentersGuideCompWidget(),
                      ),
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
