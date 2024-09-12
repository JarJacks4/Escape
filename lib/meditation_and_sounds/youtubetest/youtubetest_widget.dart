import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'youtubetest_model.dart';
export 'youtubetest_model.dart';

class YoutubetestWidget extends StatefulWidget {
  const YoutubetestWidget({
    super.key,
    required this.videoid,
  });

  final String? videoid;

  @override
  State<YoutubetestWidget> createState() => _YoutubetestWidgetState();
}

class _YoutubetestWidgetState extends State<YoutubetestWidget> {
  late YoutubetestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YoutubetestModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'youtubetest'});
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
        body: Visibility(
          visible: responsiveVisibility(
            context: context,
            tablet: false,
            tabletLandscape: false,
            desktop: false,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Flexible(
                  flex: 1,
                  child: Container(
                    width: 393.0,
                    height: 829.0,
                    decoration: BoxDecoration(
                      color: Color(0x00000220),
                    ),
                    child: Stack(
                      children: [],
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
