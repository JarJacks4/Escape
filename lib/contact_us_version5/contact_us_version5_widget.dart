import '/components/contact_us_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'contact_us_version5_model.dart';
export 'contact_us_version5_model.dart';

class ContactUsVersion5Widget extends StatefulWidget {
  const ContactUsVersion5Widget({super.key});

  static String routeName = 'ContactUsVersion5';
  static String routePath = '/contactUsVersion5';

  @override
  State<ContactUsVersion5Widget> createState() =>
      _ContactUsVersion5WidgetState();
}

class _ContactUsVersion5WidgetState extends State<ContactUsVersion5Widget> {
  late ContactUsVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUsVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ContactUsVersion5'});
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
              height: 933.55,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Erica_Anderson_(4).gif',
                  ).image,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 60.0,
                    sigmaY: 60.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0x2E39519F),
                          Color(0x57D0E3F7),
                          Color(0x84673AB7)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.contactUsCompModel,
                      updateCallback: () => safeSetState(() {}),
                      child: ContactUsCompWidget(),
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
