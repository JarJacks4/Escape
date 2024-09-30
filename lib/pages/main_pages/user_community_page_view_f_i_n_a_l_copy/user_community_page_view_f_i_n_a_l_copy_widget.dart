import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/provider_community/tabbar_home_community/tabbar_home_community_widget.dart';
import '/walkthroughs/provider_community_walkthrough.dart';
import 'dart:math';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_community_page_view_f_i_n_a_l_copy_model.dart';
export 'user_community_page_view_f_i_n_a_l_copy_model.dart';

class UserCommunityPageViewFINALCopyWidget extends StatefulWidget {
  const UserCommunityPageViewFINALCopyWidget({super.key});

  @override
  State<UserCommunityPageViewFINALCopyWidget> createState() =>
      _UserCommunityPageViewFINALCopyWidgetState();
}

class _UserCommunityPageViewFINALCopyWidgetState
    extends State<UserCommunityPageViewFINALCopyWidget>
    with TickerProviderStateMixin {
  late UserCommunityPageViewFINALCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCommunityPageViewFINALCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UserCommunityPageViewFINALCopy'});
    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'tabbarHomeCommunityOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1523250217488-ab35967e9840?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8Y2FsbSUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHx8fDE3MjExMzQ3ODF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    ).image,
                  ),
                ),
                child: Container(
                  width: 100.0,
                  height: MediaQuery.sizeOf(context).height * 0.5,
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
                              Image.network(
                                'https://images.unsplash.com/photo-1511632765486-a01980e01a18?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxjb21tdW5pdHl8ZW58MHx8fHwxNzI2NDIzNzE5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: double.infinity,
                                height: 196.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 200.0,
                                decoration: BoxDecoration(),
                              ),
                              Container(
                                width: 393.0,
                                height: 201.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xC2FFFFFF),
                                      Color(0xFCFFFFFF)
                                    ],
                                    stops: [0.2, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/ESCAPE_Logo_Clear.png',
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
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
                                      icon: Icon(
                                        Icons.menu,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'USER_COMMUNITY_VIEW_F_I_N_A_L_COPY_menu_');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'USER_COMMUNITY_VIEW_F_I_N_A_L_COPY_Circl');
                                          logFirebaseEvent(
                                              'CircleImage_navigate_to');

                                          context.pushNamed(
                                            'ProfilePage3',
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 70.0,
                                          height: 70.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            currentUserPhoto,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).animateOnPageLoad(
                            animationsMap['stackOnPageLoadAnimation']!),
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(),
                              child: wrapWithModel(
                                model: _model.tabbarHomeCommunityModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: Hero(
                                  tag: 'TabBar',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: TabbarHomeCommunityWidget(),
                                  ),
                                ),
                              )
                                  .addWalkthrough(
                                    containerHvg4gmsi,
                                    _model
                                        .providerCommunityWalkthroughController,
                                  )
                                  .animateOnPageLoad(animationsMap[
                                      'tabbarHomeCommunityOnPageLoadAnimation']!),
                            ),
                          ),
                        ),
                      ],
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

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(
              () => _model.providerCommunityWalkthroughController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
