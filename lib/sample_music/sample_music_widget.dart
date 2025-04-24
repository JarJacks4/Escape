import '/components/minimized_music_player/minimized_music_player_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sample_music_model.dart';
export 'sample_music_model.dart';

class SampleMusicWidget extends StatefulWidget {
  const SampleMusicWidget({
    super.key,
    required this.music,
  });

  final String? music;

  static String routeName = 'SampleMusic';
  static String routePath = 'sampleMusic';

  @override
  State<SampleMusicWidget> createState() => _SampleMusicWidgetState();
}

class _SampleMusicWidgetState extends State<SampleMusicWidget> {
  late SampleMusicModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SampleMusicModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SampleMusic'});
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
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(
                      FFLocalizations.of(context).getText(
                        '4cqry6o2' /* Page Title */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'The Seasons',
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                    centerTitle: false,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 3.0,
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.minimizedMusicPlayerModel,
                updateCallback: () => safeSetState(() {}),
                child: MinimizedMusicPlayerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
