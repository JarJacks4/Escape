import '/components/community_starter_page_version5_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'connection_community_start_page_version5_model.dart';
export 'connection_community_start_page_version5_model.dart';

class ConnectionCommunityStartPageVersion5Widget extends StatefulWidget {
  const ConnectionCommunityStartPageVersion5Widget({super.key});

  static String routeName = 'ConnectionCommunityStartPageVersion5';
  static String routePath = 'connectionCommunityStartPageVersion5';

  @override
  State<ConnectionCommunityStartPageVersion5Widget> createState() =>
      _ConnectionCommunityStartPageVersion5WidgetState();
}

class _ConnectionCommunityStartPageVersion5WidgetState
    extends State<ConnectionCommunityStartPageVersion5Widget> {
  late ConnectionCommunityStartPageVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ConnectionCommunityStartPageVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ConnectionCommunityStartPageVersion5'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 875.09,
                decoration: BoxDecoration(
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
                child: wrapWithModel(
                  model: _model.communityStarterPageVersion5Model,
                  updateCallback: () => safeSetState(() {}),
                  child: CommunityStarterPageVersion5Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
