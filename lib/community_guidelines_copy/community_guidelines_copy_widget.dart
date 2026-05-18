import '/components/community_guidelines_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'community_guidelines_copy_model.dart';
export 'community_guidelines_copy_model.dart';

class CommunityGuidelinesCopyWidget extends StatefulWidget {
  const CommunityGuidelinesCopyWidget({super.key});

  static String routeName = 'CommunityGuidelinesCopy';
  static String routePath = '/communityGuidelinesCopy';

  @override
  State<CommunityGuidelinesCopyWidget> createState() =>
      _CommunityGuidelinesCopyWidgetState();
}

class _CommunityGuidelinesCopyWidgetState
    extends State<CommunityGuidelinesCopyWidget> {
  late CommunityGuidelinesCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityGuidelinesCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'CommunityGuidelinesCopy'});
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
                      height: 155.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x3139519F),
                            Color(0x99FCC462),
                            Color(0xB8D0E3F7)
                          ],
                          stops: [0.0, 0.5, 1.0],
                          begin: AlignmentDirectional(1.0, -0.64),
                          end: AlignmentDirectional(-1.0, 0.64),
                        ),
                      ),
                      child: wrapWithModel(
                        model: _model.communityGuidelinesCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CommunityGuidelinesCompWidget(),
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
