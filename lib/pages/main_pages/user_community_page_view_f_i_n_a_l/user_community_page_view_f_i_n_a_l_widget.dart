import '/auth/firebase_auth/auth_util.dart';
import '/components/header_provider_community_widget.dart';
import '/components/subscription_comp2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
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
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('USER_COMMUNITY_VIEW_F_I_N_A_L_UserCommun');
      if (!(true
          ? valueOrDefault<bool>(currentUserDocument?.isSubscribed, false)
          : false)) {
        logFirebaseEvent('UserCommunityPageViewFINAL_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: SubscriptionComp2Widget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      logFirebaseEvent('UserCommunityPageViewFINAL_close_dialog_');
      Navigator.pop(context);
    });
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 376.0,
                  height: 246.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFCFFFFFF), Colors.white],
                      stops: [0.5, 0.7],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Hero(
                                  tag: currentUserPhoto,
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                    currentUserPhoto,
                                    width: double.infinity,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                height: 200.0,
                                decoration: BoxDecoration(),
                              ),
                              Container(
                                width: 393.0,
                                height: 252.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x83FFFFFF),
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground
                                    ],
                                    stops: [0.2, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: wrapWithModel(
                                    model: _model.headerProviderCommunityModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: Hero(
                                      tag: 'ProviderCommunity',
                                      transitionOnUserGestures: true,
                                      child: Material(
                                        color: Colors.transparent,
                                        child: HeaderProviderCommunityWidget(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 40.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: Color(0xB5E7C8E7),
                                      icon: Icon(
                                        Icons.menu,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_COMMUNITY_VIEW_F_I_N_A_L_menu_ICN_O');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                    Hero(
                                      tag: 'ProviderCommunity',
                                      transitionOnUserGestures: true,
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                        height:
                                            MediaQuery.sizeOf(context).width *
                                                0.2,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/ESCAPE_Logo_Clear.png',
                                          fit: BoxFit.contain,
                                          alignment: Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.tabbarHomeCommunityModel,
                updateCallback: () => safeSetState(() {}),
                updateOnChange: true,
                child: Hero(
                  tag: 'ProviderCommunity',
                  transitionOnUserGestures: true,
                  child: Material(
                    color: Colors.transparent,
                    child: TabbarHomeCommunityWidget(),
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
