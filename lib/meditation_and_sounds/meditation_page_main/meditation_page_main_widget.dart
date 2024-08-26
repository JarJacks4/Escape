import '/components/header_main_meditation/header_main_meditation_widget.dart';
import '/components/tabbar_home_meditation/tabbar_home_meditation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meditation_page_main_model.dart';
export 'meditation_page_main_model.dart';

class MeditationPageMainWidget extends StatefulWidget {
  const MeditationPageMainWidget({super.key});

  @override
  State<MeditationPageMainWidget> createState() =>
      _MeditationPageMainWidgetState();
}

class _MeditationPageMainWidgetState extends State<MeditationPageMainWidget> {
  late MeditationPageMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeditationPageMainModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MeditationPageMain'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://images.unsplash.com/photo-1513836279014-a89f7a76ae86?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8Zm9yZXN0fGVufDB8fHx8MTcyNDM5MzI3OXww&ixlib=rb-4.0.3&q=80&w=1080',
              ).image,
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xA5903E9F),
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 198.0,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.headerMainMeditationModel,
                    updateCallback: () => setState(() {}),
                    child: HeaderMainMeditationWidget(),
                  ),
                ),
                Expanded(
                  child: wrapWithModel(
                    model: _model.tabbarHomeMeditationModel,
                    updateCallback: () => setState(() {}),
                    child: TabbarHomeMeditationWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
