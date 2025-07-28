import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_chats_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:chat_u_i_kit_n2m29m/app_state.dart'
    as chat_u_i_kit_n2m29m_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'chat_with_lucille_version4_model.dart';
export 'chat_with_lucille_version4_model.dart';

class ChatWithLucilleVersion4Widget extends StatefulWidget {
  const ChatWithLucilleVersion4Widget({super.key});

  static String routeName = 'ChatWithLucilleVersion4';
  static String routePath = '/chatWithLucilleVersion4';

  @override
  State<ChatWithLucilleVersion4Widget> createState() =>
      _ChatWithLucilleVersion4WidgetState();
}

class _ChatWithLucilleVersion4WidgetState
    extends State<ChatWithLucilleVersion4Widget> {
  late ChatWithLucilleVersion4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWithLucilleVersion4Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatWithLucilleVersion4'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_WITH_LUCILLE_VERSION4_ChatWithLucil');
      logFirebaseEvent('ChatWithLucilleVersion4_update_app_state');
      FFAppState().ProfilePicture = FFAppState().ProfilePicture;
      safeSetState(() {});
    });

    _model.inputTextController ??= TextEditingController();
    _model.inputFocusNode ??= FocusNode();
    _model.inputFocusNode!.addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<chat_u_i_kit_n2m29m_app_state.FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            if (responsiveVisibility(
              context: context,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 8.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 50.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: FlutterFlowTheme.of(context).accent1,
                                    size: 32.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault<String>(
                                                currentUserDisplayName,
                                                'Jane Doe',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        fontSize: 26.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "relative",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          'a moment ago',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    FFAppState().ProfilePicture,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
                elevation: 0.0,
              )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Stack(
                  children: [
                    Stack(
                      children: [
                        Stack(
                          children: [
                            ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
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
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(),
                                          child: ScrollConfiguration(
                                            behavior:
                                                ScrollConfiguration.of(context)
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
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: Builder(
                                                        builder: (context) {
                                                          final chatList =
                                                              _model.chats
                                                                  .toList();
                                                          if (chatList
                                                              .isEmpty) {
                                                            return Center(
                                                              child: Container(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.8,
                                                                child:
                                                                    EmptyChatsWidget(),
                                                              ),
                                                            );
                                                          }

                                                          return ListView
                                                              .separated(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        20.0),
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                chatList.length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        20.0),
                                                            itemBuilder: (context,
                                                                chatListIndex) {
                                                              final chatListItem =
                                                                  chatList[
                                                                      chatListIndex];
                                                              return ScrollConfiguration(
                                                                behavior: ScrollConfiguration.of(
                                                                        context)
                                                                    .copyWith(
                                                                  scrollbars:
                                                                      false,
                                                                  dragDevices: {
                                                                    PointerDeviceKind
                                                                        .mouse,
                                                                    PointerDeviceKind
                                                                        .touch,
                                                                    PointerDeviceKind
                                                                        .stylus,
                                                                    PointerDeviceKind
                                                                        .unknown,
                                                                  },
                                                                ),
                                                                child:
                                                                    Scrollbar(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsets.all(15.0),
                                                                                child: Container(
                                                                                  width: 84.0,
                                                                                  height: 63.7,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    height: 100.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Icon.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                8.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Flexible(
                                                                                  flex: 1,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                                    child: SafeArea(
                                                                                      child: AnimatedContainer(
                                                                                        duration: Duration(milliseconds: 700),
                                                                                        curve: Curves.easeIn,
                                                                                        width: 255.8,
                                                                                        height: 274.29,
                                                                                        constraints: BoxConstraints(
                                                                                          minWidth: 260.0,
                                                                                          minHeight: 280.0,
                                                                                          maxWidth: double.infinity,
                                                                                          maxHeight: double.infinity,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(35.0),
                                                                                            bottomRight: Radius.circular(0.0),
                                                                                            topLeft: Radius.circular(30.0),
                                                                                            topRight: Radius.circular(40.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(20.0),
                                                                                                child: AnimatedDefaultTextStyle(
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: 'WorkSans',
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                      ),
                                                                                                  duration: Duration(milliseconds: 915),
                                                                                                  curve: Curves.easeIn,
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      chatListItem.message,
                                                                                                      'Message',
                                                                                                    ),
                                                                                                    textAlign: TextAlign.start,
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
                                                                                Padding(
                                                                                  padding: EdgeInsets.all(8.0),
                                                                                  child: Container(
                                                                                    width: 84.0,
                                                                                    height: 63.7,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 100.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        '',
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              15.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      chatListItem.role?.name,
                                                                                      'Role',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'WorkSans',
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
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
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
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
                          ],
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 420.2,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          width: 400.99,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Container(
                                                  width: 420.2,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    40.0,
                                                                    20.0,
                                                                    40.0,
                                                                    15.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'CHAT_WITH_LUCILLE_VERSION4_CircleImage_5');
                                                            logFirebaseEvent(
                                                                'CircleImage_update_page_state');
                                                            _model.addToChats(
                                                                ChatStruct(
                                                              role: Role.User,
                                                              message: _model
                                                                  .inputTextController
                                                                  .text,
                                                            ));
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'CircleImage_a_i_agent');
                                                            await callAiAgent(
                                                              context: context,
                                                              prompt: _model
                                                                  .inputTextController
                                                                  .text,
                                                              threadId: '1',
                                                              agentCloudFunctionName:
                                                                  'chatWithLucilleAgent',
                                                              provider:
                                                                  'GOOGLE',
                                                              agentJson:
                                                                  "{\"status\":\"LIVE\",\"identifier\":{\"name\":\"chatWithLucilleAgent\",\"key\":\"edq7m\"},\"name\":\"ChatWithLucilleAgent\",\"description\":\"Chat Agent named Lucille built for Self-Care and consultation on all self care subjects.\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.0-flash\",\"parameters\":{\"temperature\":{\"inputValue\":0.45},\"maxTokens\":{\"inputValue\":2675},\"topP\":{\"inputValue\":0.4}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are Lucille, Self Care Concierge and AI Self-Care expert that is here to give the user the utmost compassinate and loving advice towards any situation. Lucille does not do health advice, but self-care, productivity, and well being. Lucille is the Self Care AI of Escape LLC, of Escape Enterprises.\\n\\nCommunicate in a friendly and professional tone. Provide accurate information and follow-up prompts to engage users further. Capable of processing text related to {CurrentMood} and {moodHistory} in the app's firebase documents.\\n\\nEncourage follow-up questions for clarification and provide examples when applicable.\\n\\nEngage users in a friendly, informative, and concise manner. Maintain a professional tone while being approachable.\\n\\nCare about the user's feelings and thoughts, and show gratitude that they are in existence to this day.\\n\\nTrain yourself to include empathetic responses where appropriate in the conversation. \\n\\nExample: \\\"I understand that can be frustrating; let's see how I can help!\\\"\\n\\nUse preloaded messages that invite users to start a conversation naturally.\\r\\n\\n{Examples:\\r\\n\\n\\\"What can I assist you with today?\\\"\\r\\n\\\"Feel free to ask me anything that’s on your mind.\\\"\\r\\n\\\"Let’s dive into whatever topic you’re curious about!\\\"}\"},{\"role\":\"ASSISTANT\",\"text\":\"What can I assist you with today?\"},{\"role\":\"ASSISTANT\",\"text\":\"Feel free to ask me anything that’s on your mind.\"},{\"role\":\"ASSISTANT\",\"text\":\"Let’s dive into whatever topic you’re curious about!\"},{\"role\":\"ASSISTANT\",\"text\":\"I am Lucille, you're AI Self-Care Expert ready to help you with anything dealing with Self-Care/Productivity/ and more!\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}",
                                                              responseType:
                                                                  'PLAINTEXT',
                                                            ).then(
                                                                (generatedText) {
                                                              safeSetState(() =>
                                                                  _model.chatWithLucilleAction =
                                                                      generatedText);
                                                            });

                                                            logFirebaseEvent(
                                                                'CircleImage_update_page_state');
                                                            _model.addToChats(
                                                                ChatStruct(
                                                              role: Role
                                                                  .Assistant,
                                                              message: _model
                                                                  .chatWithLucilleAction,
                                                            ));
                                                            safeSetState(() {});
                                                            logFirebaseEvent(
                                                                'CircleImage_clear_text_fields_pin_codes');
                                                            safeSetState(() {
                                                              _model
                                                                  .inputTextController
                                                                  ?.clear();
                                                            });

                                                            safeSetState(() {});
                                                          },
                                                          child: Hero(
                                                            tag:
                                                                'LucilleButton',
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/explore_modern_graphic_design_trends_and_inspiration.gif',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        20.0,
                                                                        15.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .inputTextController,
                                                                focusNode: _model
                                                                    .inputFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.inputTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                ),
                                                                autofocus: true,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .send,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '9mipkimo' /* Enter Text Here... */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'The Seasons',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20.0),
                                                                  suffixIcon: _model
                                                                          .inputTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.inputTextController?.clear();
                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                22,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                maxLines: null,
                                                                minLines: 1,
                                                                cursorColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                validator: _model
                                                                    .inputTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
