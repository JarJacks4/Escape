import '/components/change_your_avatar_widget.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/earn_points_with_avatar_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/progress_bar_final_widget.dart';
import '/components/self_care_routine_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
                              8.0, 35.0, 8.0, 0.0),
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
                                      'y261kaek' /* Self Care AI */,
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
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 8.0, 0.0),
                              child: wrapWithModel(
                                model: _model.progressBarFinalModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ProgressBarFinalWidget(),
                              ),
                            ),
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
        body: SingleChildScrollView(
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
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
                                            model:
                                                _model.chatWithLucilleCardModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ChatWithLucilleCardWidget(),
                                          ).animateOnPageLoad(animationsMap[
                                              'chatWithLucilleCardOnPageLoadAnimation']!),
                                      () => wrapWithModel(
                                            model: _model.moodTrackingCardModel,
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
                                  alignment: AlignmentDirectional(-1.0, 0.0),
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
                                    model: _model.earnPointsWithAvatarCardModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: EarnPointsWithAvatarCardWidget(),
                                  ).animateOnPageLoad(animationsMap[
                                      'earnPointsWithAvatarCardOnPageLoadAnimation']!),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: wrapWithModel(
                                    model: _model.selfCareRoutineCardModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SelfCareRoutineCardWidget(),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: wrapWithModel(
                                    model: _model.changeYourAvatarModel,
                                    updateCallback: () => safeSetState(() {}),
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
    );
  }
}
