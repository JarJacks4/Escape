import '/components/quest_comp_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'quests_page_model.dart';
export 'quests_page_model.dart';

class QuestsPageWidget extends StatefulWidget {
  const QuestsPageWidget({super.key});

  static String routeName = 'QuestsPage';
  static String routePath = 'questsPage';

  @override
  State<QuestsPageWidget> createState() => _QuestsPageWidgetState();
}

class _QuestsPageWidgetState extends State<QuestsPageWidget> {
  late QuestsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestsPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'QuestsPage'});
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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/935fcf2608d9c428008d505d92c3a910.gif',
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
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x27EDF1F7),
                              Color(0x42D0E3F7),
                              Color(0xDAE7A42E)
                            ],
                            stops: [0.0, 0.5, 1.0],
                            begin: AlignmentDirectional(1.0, -0.64),
                            end: AlignmentDirectional(-1.0, 0.64),
                          ),
                        ),
                        child: wrapWithModel(
                          model: _model.questCompVersion5Model,
                          updateCallback: () => safeSetState(() {}),
                          child: QuestCompVersion5Widget(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
