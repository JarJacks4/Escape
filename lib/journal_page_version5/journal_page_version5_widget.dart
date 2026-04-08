import '/components/journal_page1_widget.dart';
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
import 'journal_page_version5_model.dart';
export 'journal_page_version5_model.dart';

class JournalPageVersion5Widget extends StatefulWidget {
  const JournalPageVersion5Widget({super.key});

  static String routeName = 'JournalPageVersion5';
  static String routePath = 'journalPageVersion5';

  @override
  State<JournalPageVersion5Widget> createState() =>
      _JournalPageVersion5WidgetState();
}

class _JournalPageVersion5WidgetState extends State<JournalPageVersion5Widget> {
  late JournalPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'JournalPageVersion5'});
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
              height: 882.8,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/922f59d7455e56aacdec50df5571bcd744c166a0_(1)_(1)_(2).gif',
                  ).image,
                ),
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 40.0,
                    sigmaY: 40.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 117.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 40.0,
                          color: Color(0x7BD0E3F7),
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                          spreadRadius: 10.0,
                        )
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Color(0x294CF6F6),
                          Color(0x5339D9C1),
                          Color(0xBFD0E3F7)
                        ],
                        stops: [0.0, 0.5, 1.0],
                        begin: AlignmentDirectional(1.0, -0.64),
                        end: AlignmentDirectional(-1.0, 0.64),
                      ),
                    ),
                    child: wrapWithModel(
                      model: _model.journalPage1Model,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: Hero(
                        tag: 'journal',
                        transitionOnUserGestures: true,
                        child: Material(
                          color: Colors.transparent,
                          child: JournalPage1Widget(),
                        ),
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
