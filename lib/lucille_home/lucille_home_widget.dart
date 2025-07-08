import '/auth/firebase_auth/auth_util.dart';
import '/components/change_your_avatar_widget.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/earn_points_with_avatar_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/self_care_routine_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'lucille_home_model.dart';
export 'lucille_home_model.dart';

class LucilleHomeWidget extends StatefulWidget {
  const LucilleHomeWidget({super.key});

  static String routeName = 'LucilleHome';
  static String routePath = 'lucilleHome';

  @override
  State<LucilleHomeWidget> createState() => _LucilleHomeWidgetState();
}

class _LucilleHomeWidgetState extends State<LucilleHomeWidget>
    with TickerProviderStateMixin {
  late LucilleHomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleHomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LucilleHome'});
    animationsMap.addAll({
      'chatWithLucilleCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(25.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'moodTrackingCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'generateSoundscapesCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'earnPointsWithAvatarCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1800.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 3600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'progressBarOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

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
                preferredSize: Size.fromHeight(140.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    title: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 35.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: AnimatedDefaultTextStyle(
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'The Seasons',
                                        color: Colors.black,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                      ),
                                  duration: Duration(milliseconds: 600),
                                  curve: Curves.easeIn,
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'y261kaek' /* Lucille, Self Care AI */,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LUCILLE_HOME_PAGE_Image_wmbu3h7i_ON_TAP');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed(
                                            HomeVersion4Widget.routeName);
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Rectangle_1.png',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'imageOnPageLoadAnimation']!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 540),
                          curve: Curves.easeIn,
                          width: double.infinity,
                          height: 59.97,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent4,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1.0,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                offset: Offset(
                                  0.0,
                                  1.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Hero(
                                        tag: valueOrDefault<String>(
                                          _model.profilePicture?.photoUrl,
                                          'https://res.cloudinary.com/dbyduwpud/image/upload/v1751860346/AICircleLucilleChat_uo87av.gif',
                                        ),
                                        transitionOnUserGestures: true,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              _model.profilePicture?.photoUrl,
                                              'https://res.cloudinary.com/dbyduwpud/image/upload/v1751860346/AICircleLucilleChat_uo87av.gif',
                                            ),
                                            width: 46.4,
                                            height: 46.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          currentUserDisplayName,
                                          'Jane Doe',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'The Seasons',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation']!),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 100.0,
                                child: VerticalDivider(
                                  thickness: 1.0,
                                  indent: 8.0,
                                  endIndent: 8.0,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 185.9,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 20.0, 0.0),
                                            child: LinearPercentIndicator(
                                              percent: FFAppState()
                                                  .pointsEarned
                                                  .toDouble(),
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.45,
                                              lineHeight: 25.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              center: Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .pointsEarned
                                                      .toString(),
                                                  '0 Points',
                                                ).maybeHandleOverflow(
                                                  maxChars: 50,
                                                  replacement: '…',
                                                ),
                                                textAlign: TextAlign.start,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                              ),
                                              barRadius: Radius.circular(80.0),
                                              padding: EdgeInsets.zero,
                                            ).animateOnPageLoad(animationsMap[
                                                'progressBarOnPageLoadAnimation']!),
                                          ),
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
                    background: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                    titlePadding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false,
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.unknown,
            },
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 1736.9,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/Dark_Future_-_Stefan_Kang.gif',
                        ).image,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                          width: 100.0,
                          height: 823.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFEDF1F7), Color(0xD7D0E3F7)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.0, -1.0),
                              end: AlignmentDirectional(0, 1.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'b7n6ayf2' /* Try Your Self Care AI */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'The Seasons',
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 289.0,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.0),
                                    child: MasonryGridView.builder(
                                      gridDelegate:
                                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 10.0,
                                      mainAxisSpacing: 10.0,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return [
                                          () => wrapWithModel(
                                                model: _model
                                                    .chatWithLucilleCardModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    ChatWithLucilleCardWidget(),
                                              ).animateOnPageLoad(animationsMap[
                                                  'chatWithLucilleCardOnPageLoadAnimation']!),
                                          () => wrapWithModel(
                                                model: _model
                                                    .moodTrackingCardModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: MoodTrackingCardWidget(),
                                              ).animateOnPageLoad(animationsMap[
                                                  'moodTrackingCardOnPageLoadAnimation']!),
                                          () => wrapWithModel(
                                                model: _model
                                                    .generateSoundscapesCardModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child:
                                                    GenerateSoundscapesCardWidget(),
                                              ).animateOnPageLoad(animationsMap[
                                                  'generateSoundscapesCardOnPageLoadAnimation']!),
                                        ][index]();
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5l0maxf3' /* Get Centered */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'The Seasons',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: wrapWithModel(
                                        model: _model
                                            .earnPointsWithAvatarCardModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: EarnPointsWithAvatarCardWidget(),
                                      ).animateOnPageLoad(animationsMap[
                                          'earnPointsWithAvatarCardOnPageLoadAnimation']!),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: wrapWithModel(
                                        model: _model.selfCareRoutineCardModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: SelfCareRoutineCardWidget(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: wrapWithModel(
                                        model: _model.changeYourAvatarModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ChangeYourAvatarWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
