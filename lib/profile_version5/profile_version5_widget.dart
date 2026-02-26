import '/components/profile_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'profile_version5_model.dart';
export 'profile_version5_model.dart';

class ProfileVersion5Widget extends StatefulWidget {
  const ProfileVersion5Widget({super.key});

  static String routeName = 'ProfileVersion5';
  static String routePath = 'profileVersion5';

  @override
  State<ProfileVersion5Widget> createState() => _ProfileVersion5WidgetState();
}

class _ProfileVersion5WidgetState extends State<ProfileVersion5Widget> {
  late ProfileVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ProfileVersion5'});
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
        body: SingleChildScrollView(
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.372,
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
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x96D0E3F7),
                            Color(0x35A352F7),
                            Color(0x7EFCC462)
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(1.0, -0.87),
                          end: AlignmentDirectional(-1.0, 0.87),
                        ),
                      ),
                      child: wrapWithModel(
                        model: _model.profileVersion5CompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ProfileVersion5CompWidget(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
