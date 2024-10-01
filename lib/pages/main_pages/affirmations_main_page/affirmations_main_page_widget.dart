import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/headers/header_affirmations/header_affirmations_widget.dart';
import '/meditation_and_sounds/tabbar_home_affirmations/tabbar_home_affirmations_widget.dart';
import 'package:flutter/material.dart';
import 'affirmations_main_page_model.dart';
export 'affirmations_main_page_model.dart';

class AffirmationsMainPageWidget extends StatefulWidget {
  const AffirmationsMainPageWidget({super.key});

  @override
  State<AffirmationsMainPageWidget> createState() =>
      _AffirmationsMainPageWidgetState();
}

class _AffirmationsMainPageWidgetState
    extends State<AffirmationsMainPageWidget> {
  late AffirmationsMainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffirmationsMainPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AffirmationsMainPage'});
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(
                'https://images.unsplash.com/photo-1579101450453-c9fb7b8a490d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMXx8YWZmaXJtYXRpb25zfGVufDB8fHx8MTcwOTMyODU4MXww&ixlib=rb-4.0.3&q=80&w=1080',
              ).image,
            ),
          ),
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xA9006874),
                  FlutterFlowTheme.of(context).primaryBackground
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: 198.0,
                  decoration: const BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.headerAffirmationsModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const HeaderAffirmationsWidget(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: wrapWithModel(
                      model: _model.tabbarHomeAffirmationsModel,
                      updateCallback: () => safeSetState(() {}),
                      updateOnChange: true,
                      child: const Hero(
                        tag: 'TabBar',
                        transitionOnUserGestures: true,
                        child: Material(
                          color: Colors.transparent,
                          child: TabbarHomeAffirmationsWidget(),
                        ),
                      ),
                    ),
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
