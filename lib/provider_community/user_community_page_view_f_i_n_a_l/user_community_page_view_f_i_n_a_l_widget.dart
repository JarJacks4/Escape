import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/headers/header_provider_community/header_provider_community_widget.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_community_page_view_f_i_n_a_l_model.dart';
export 'user_community_page_view_f_i_n_a_l_model.dart';

class UserCommunityPageViewFINALWidget extends StatefulWidget {
  const UserCommunityPageViewFINALWidget({super.key});

  @override
  State<UserCommunityPageViewFINALWidget> createState() =>
      _UserCommunityPageViewFINALWidgetState();
}

class _UserCommunityPageViewFINALWidgetState
    extends State<UserCommunityPageViewFINALWidget> {
  late UserCommunityPageViewFINALModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCommunityPageViewFINALModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UserCommunityPageViewFINAL'});
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: wrapWithModel(
                  model: _model.headerProviderCommunityModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderProviderCommunityWidget(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: wrapWithModel(
                model: _model.tabbarHomeCommunityModel,
                updateCallback: () => setState(() {}),
                child: TabbarHomeCommunityWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
