import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/confetti_page_basic_comp_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/todays_reflection_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_page_f_i_n_a_l_copy_model.dart';
export 'journal_page_f_i_n_a_l_copy_model.dart';

class JournalPageFINALCopyWidget extends StatefulWidget {
  const JournalPageFINALCopyWidget({super.key});

  static String routeName = 'journalPageFINALCopy';
  static String routePath = 'journalPageFINALCopy';

  @override
  State<JournalPageFINALCopyWidget> createState() =>
      _JournalPageFINALCopyWidgetState();
}

class _JournalPageFINALCopyWidgetState extends State<JournalPageFINALCopyWidget>
    with TickerProviderStateMixin {
  late JournalPageFINALCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPageFINALCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'journalPageFINALCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('JOURNAL_F_I_N_A_L_COPY_journalPageFINALC');
      logFirebaseEvent('journalPageFINALCopy_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'Generate a text a 200 characterl quote from a real person that uplifts the user and is based off of the user\'s {CurrentMood}: \n\nCurrentMood',
        threadId: '1',
        agentCloudFunctionName: 'lucilleGenerateQuote',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lucilleGenerateQuote\",\"key\":\"fgsej\"},\"name\":\"Lucille Generate Quote\",\"description\":\"This is a AI Agent named Lucille for Escape that helps generate a quote for the user based on their current mood.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Generate a text a 200 characterl quote from a real person that uplifts the user and is based off of the user\'s {CurrentMood}: \\n\\nCurrentMood\"},{\"role\":\"USER\",\"text\":\"Could you help me generate a 200 character quote from a real person that uplifts the user and is based off of the user\'s {CurrentMood}: \\n\\nCurrentMood\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.generateQuoteForJournal = generatedText);
      });

      logFirebaseEvent('journalPageFINALCopy_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'The user\'s current mood can be found in the CurrentMood document and is known as: {{CurrentMood}}Based on this, generate a calming, 3-line self-reflection journal prompt.',
        threadId: '2',
        agentCloudFunctionName: 'lucilleJournalGeneration',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"lucilleJournalGeneration\",\"key\":\"y28g9\"},\"name\":\"LucilleJournalGeneration\",\"description\":\"This is a AI Agent named Lucille for Escape that helps generate a journal entry for the user based on their current mood.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":1},\"maxTokens\":{\"inputValue\":8192},\"topP\":{\"inputValue\":0.95}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"Generate a text a 200 character journal entry that uplifts the user and is based off of the user\'s {CurrentMood}: \\n\\nCurrentMood\"},{\"role\":\"USER\",\"text\":\"Coulud I please get a Generated text that 200 character journal entry that uplifts the me and is based off of my {CurrentMood} in the Firebase Firestore: \\n\\nCurrentMood\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.journalGeneration = generatedText);
      });

      if (_model.generateQuoteForJournal == '') {
        logFirebaseEvent('journalPageFINALCopy_a_i_agent');
        clearAiChat('1', 'GOOGLE');
        logFirebaseEvent('journalPageFINALCopy_a_i_agent');
        clearAiChat('2', 'GOOGLE');
      } else {
        return;
      }

      logFirebaseEvent('journalPageFINALCopy_update_app_state');
      FFAppState().JournalPrompt = valueOrDefault<String>(
        _model.journalGeneration,
        'What three things brought you joy today, and how can you incorporate more of these moments into your daily life?',
      );
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(100.0),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  automaticallyImplyLeading: false,
                  actions: [],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 52.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8s0bwozu' /* Journal */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'The Seasons',
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
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
                                          'JOURNAL_F_I_N_A_L_COPY_Image_qvebn5mg_ON');
                                      logFirebaseEvent('Image_navigate_to');

                                      context.pushNamed(
                                          HomeVersion4Widget.routeName);
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/Rectangle_1.png',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.352,
                                        height: 156.0,
                                        fit: BoxFit.contain,
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
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  elevation: 0.0,
                ),
              )
            : null,
        body: Stack(
          children: [
            ScrollConfiguration(
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
                controller: _model.columnController1,
                child: SingleChildScrollView(
                  primary: false,
                  controller: _model.columnController1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            dateTimeFormat(
                                              "MMMMEEEEd",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  fontFamily: 'The Seasons',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                'Good Day,${currentUserDisplayName}!',
                                                'Good Day, John!',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(22.0),
                                            child: Image.network(
                                              currentUserPhoto,
                                              width: 45.0,
                                              height: 45.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 12.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7wxzf4ta' /* Today's Quote */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.mood_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'g6vurjiq' /* "The only way to do great work... */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'WorkSans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.todaysReflectionCompModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TodaysReflectionCompWidget(),
                      ),
                    ].divide(SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
            if (false)
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: ScrollConfiguration(
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
                    controller: _model.columnController2,
                    child: SingleChildScrollView(
                      controller: _model.columnController2,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'JOURNAL_F_I_N_A_L_COPY_BACK_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_back');
                                      context.safePop();
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'gf3knbjk' /* Back */,
                                    ),
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 22.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 10.0, 16.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                'Good Day, ${currentUserDisplayName} 👋!',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'WorkSans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 25.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1C2F44),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 16.0, 16.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'yltyt294' /* Today's Quotes */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        valueOrDefault<String>(
                                                      _model
                                                          .generateQuoteForJournal,
                                                      '\"Our Deepest fear is not that we are inadequate, but that we are powerful beyond measure.\"',
                                                    ),
                                                    style: GoogleFonts
                                                        .jacquesFrancois(
                                                      fontSize: 20.0,
                                                    ),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                              textAlign: TextAlign.start,
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 8.0)),
                                      ),
                                    ].divide(SizedBox(height: 15.0)),
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Material(
                              color: Colors.transparent,
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: Offset(
                                        4.0,
                                        4.0,
                                      ),
                                      spreadRadius: 3.0,
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 16.0),
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                      dragDevices: {
                                        PointerDeviceKind.mouse,
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind.stylus,
                                        PointerDeviceKind.unknown,
                                      },
                                    ),
                                    child: Scrollbar(
                                      controller: _model.columnController3,
                                      child: SingleChildScrollView(
                                        primary: false,
                                        controller: _model.columnController3,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  13.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'f10avnx7' /* Journal For Today */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      25.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'JOURNAL_F_I_N_A_L_COPY_Icon_atygwhrl_ON_');
                                                      logFirebaseEvent(
                                                          'Icon_scroll_to');
                                                      await _model
                                                          .columnController3
                                                          ?.animateTo(
                                                        _model
                                                            .columnController3!
                                                            .position
                                                            .maxScrollExtent,
                                                        duration: Duration(
                                                            milliseconds: 100),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.edit_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      13.0, 25.0, 13.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '0uud4axq' /* How are you feeling today? */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'WorkSans',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                            FlutterFlowChoiceChips(
                                              options: [
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'n8etmh2z' /* Great */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'c9clwhq9' /* Good */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'n57qbeua' /* Okay */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'txpvy0pb' /* Happy */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '7zax35gy' /* Cheerful */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '6vo659he' /* Sad */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'yt8q0cr2' /* Depressed */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0s2wlomh' /* Anxious */,
                                                )),
                                                ChipData(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0f58qbun' /* Nonchalant */,
                                                ))
                                              ],
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .choiceChipsValues = val);
                                                logFirebaseEvent(
                                                    'JOURNAL_F_I_N_A_L_COPY_ChoiceChips_xyv2m');
                                                logFirebaseEvent(
                                                    'ChoiceChips_backend_call');

                                                await currentUserDocument!
                                                    .moodHistory!
                                                    .update({
                                                  ...createUserMoodsRecordData(
                                                    currentMood: _model
                                                        .choiceChipsValues
                                                        ?.take(5)
                                                        .toList()
                                                        .contains(_model
                                                            .choiceChipsValues
                                                            ?.length
                                                            .toString())
                                                        .toString(),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'moodHistory': FieldValue
                                                          .arrayUnion([
                                                        _model.choiceChipsValues
                                                            ?.contains(_model
                                                                .choiceChipsValues
                                                                ?.length
                                                                .toString())
                                                            .toString()
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              },
                                              selectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFFF0831A),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'The Seasons',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                iconColor: Color(0x00000000),
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderColor: Color(0x8ED0E3F7),
                                                borderWidth: 4.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              unselectedChipStyle: ChipStyle(
                                                backgroundColor:
                                                    Color(0xFF1C2F44),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .jacquesFrancois(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                iconColor: Color(0x00000000),
                                                iconSize: 16.0,
                                                elevation: 0.0,
                                                borderColor: Color(0xFF2A425B),
                                                borderWidth: 4.0,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              chipSpacing: 10.0,
                                              rowSpacing: 12.0,
                                              multiselect: true,
                                              initialized:
                                                  _model.choiceChipsValues !=
                                                      null,
                                              alignment: WrapAlignment.center,
                                              controller: _model
                                                      .choiceChipsValueController ??=
                                                  FormFieldController<
                                                      List<String>>(
                                                [],
                                              ),
                                              wrapped: true,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 25.0, 12.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'qf6ptx26' /* Reflection Prompt */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'The Seasons',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      fontSize: 22.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(15.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .JournalPrompt,
                                                      'What three things brought you joy today, and how can you incorporate more of these moments into your daily life?',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () => safeSetState(() {}),
                                                    ),
                                                    autofocus: false,
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    textInputAction:
                                                        TextInputAction.go,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '9masnl6u' /* Type Here... */,
                                                      ),
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'xrohbwh3' /* Write... */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      suffixIcon: _model
                                                              .textController!
                                                              .text
                                                              .isNotEmpty
                                                          ? InkWell(
                                                              onTap: () async {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Icon(
                                                                Icons.clear,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                size: 22,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLines: 50,
                                                    minLines: 10,
                                                    keyboardType:
                                                        TextInputType.multiline,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .textControllerValidator
                                                        .asValidator(context),
                                                    inputFormatters: [
                                                      if (!isAndroid && !isiOS)
                                                        TextInputFormatter
                                                            .withFunction(
                                                                (oldValue,
                                                                    newValue) {
                                                          return TextEditingValue(
                                                            selection: newValue
                                                                .selection,
                                                            text: newValue.text
                                                                .toCapitalization(
                                                                    TextCapitalization
                                                                        .sentences),
                                                          );
                                                        }),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'likf65fy' /* Quick Exercises */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily:
                                                                    'The Seasons',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                  ScrollConfiguration(
                                                    behavior:
                                                        ScrollConfiguration.of(
                                                                context)
                                                            .copyWith(
                                                      scrollbars: false,
                                                      dragDevices: {
                                                        PointerDeviceKind.mouse,
                                                        PointerDeviceKind.touch,
                                                        PointerDeviceKind
                                                            .stylus,
                                                        PointerDeviceKind
                                                            .unknown,
                                                      },
                                                    ),
                                                    child: Scrollbar(
                                                      controller:
                                                          _model.rowController,
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        controller: _model
                                                            .rowController,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 131.2,
                                                                  height:
                                                                      135.89,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0xFCD0E3F7),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            2.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .generateSoundscapesCardModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        GenerateSoundscapesCardWidget(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 131.2,
                                                                  height: 132.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0xFCD0E3F7),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            2.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .chatWithLucilleCardModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        ChatWithLucilleCardWidget(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 131.2,
                                                                  height: 132.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: Color(
                                                                            0xFCD0E3F7),
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                        spreadRadius:
                                                                            5.0,
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0),
                                                                  ),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .moodTrackingCardModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        MoodTrackingCardWidget(),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 30.0))
                                                              .around(SizedBox(
                                                                  width: 30.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'JOURNAL_F_I_N_A_L_COPY_SAVE_REFLECTION_B');
                                                  logFirebaseEvent(
                                                      'Button_update_app_state');
                                                  FFAppState()
                                                          .ImprovingThoughts =
                                                      _model
                                                          .textController.text;
                                                  FFAppState().moods = (_model
                                                          .choiceChipsValues!
                                                          .take(5)
                                                          .toList()
                                                          .isNotEmpty)
                                                      .toString();
                                                  FFAppState().update(() {});
                                                  logFirebaseEvent(
                                                      'Button_show_snack_bar');
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Journal Entry Saved!',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                    ),
                                                  );
                                                  logFirebaseEvent(
                                                      'Button_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ConfettiPageBasicCompWidget(),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'f5d2vurj' /* Save Reflection */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 45.0,
                                                  padding: EdgeInsets.all(8.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 16.0)),
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
