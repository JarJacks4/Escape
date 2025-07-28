import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/backspace_icon_with_badge_widget.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/inputs/message_input/message_input_widget.dart';
import '/messages/image_attachment/image_attachment_widget.dart';
import '/messages/text_message/text_message_widget.dart';
import '/messages/typing_indicator/typing_indicator_widget.dart';
import '/messages/upload_attachment/upload_attachment_widget.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';
  static void maybeSetRouteName(String? updatedRouteName) =>
      routeName = updatedRouteName ?? routeName;
  static void maybeSetRoutePath(String? updatedRoutePath) =>
      routePath = updatedRoutePath ?? routePath;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding12,
                          0.0,
                        ),
                        0.0,
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding12,
                          0.0,
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.backspaceIconWithBadgeModel,
                          updateCallback: () => safeSetState(() {}),
                          child: BackspaceIconWithBadgeWidget(
                            notificationsCount: 0,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'John Doe',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Text(
                                'Seen 1h ago',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: wrapWithModel(
                            model: _model.customAvatarModel,
                            updateCallback: () => safeSetState(() {}),
                            child: CustomAvatarWidget(
                              showOnlineStatus: true,
                              isSmallSize: false,
                              sender: UserStruct(
                                avatarUrl:
                                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                status: UserStatus.ONLINE,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        wrapWithModel(
                          model: _model.uploadAttachmentModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: UploadAttachmentWidget(
                            isUser: true,
                            caption: 'This file is enough I think!',
                            attachment: AttachmentStruct(
                              url: 'https://',
                              sizeText: '148KB',
                              fileName: 'invoice',
                              fileExtension: FileExtension.PDF,
                            ),
                            sender: UserStruct(
                              avatarUrl:
                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                            onDownload: () async {},
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: wrapWithModel(
                            model: _model.textMessageModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: TextMessageWidget(
                              isUser: false,
                              hasAngledCorner: true,
                              message: MessageStruct(
                                text:
                                    'This is a very long message. This is a very long message.',
                                timestamp: DateTime.fromMicrosecondsSinceEpoch(
                                    1742675400000000),
                                status: MessageStatus.READ,
                                sender: UserStruct(
                                  avatarUrl:
                                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                utility_functions_library_8g4bud_app_constant
                                    .FFAppConstants.padding8,
                                0.0,
                              )),
                          child: wrapWithModel(
                            model: _model.imageAttachmentModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageAttachmentWidget(
                              isUser: false,
                              imageContainerW: 300.0,
                              imageContainerH: 200.0,
                              sender: UserStruct(
                                avatarUrl:
                                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                              ),
                              imgAttachments: FFAppState().dummyGifAttachment,
                              onImgContainerTap: () async {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              0.0,
                              0.0,
                              valueOrDefault<double>(
                                utility_functions_library_8g4bud_app_constant
                                    .FFAppConstants.padding8,
                                0.0,
                              )),
                          child: wrapWithModel(
                            model: _model.imageAttachmentModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: ImageAttachmentWidget(
                              isUser: true,
                              imageContainerW: 300.0,
                              imageContainerH: 200.0,
                              sender: UserStruct(
                                avatarUrl:
                                    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                              ),
                              imgAttachments: FFAppState().dummyGifAttachment,
                              onImgContainerTap: () async {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              8.0,
                              0.0,
                              valueOrDefault<double>(
                                utility_functions_library_8g4bud_app_constant
                                    .FFAppConstants.padding8,
                                0.0,
                              )),
                          child: wrapWithModel(
                            model: _model.textMessageModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: TextMessageWidget(
                              isUser: true,
                              hasAngledCorner: true,
                              message: MessageStruct(
                                text:
                                    'This is a very long message. This is a very long message.',
                                timestamp: DateTime.fromMicrosecondsSinceEpoch(
                                    1742675400000000),
                                status: MessageStatus.READ,
                                sender: UserStruct(
                                  avatarUrl:
                                      'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                ),
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.imageAttachmentModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: ImageAttachmentWidget(
                            isUser: false,
                            imageContainerW: 300.0,
                            imageContainerH: 200.0,
                            sender: UserStruct(
                              avatarUrl:
                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                            imgAttachments: FFAppState().dummyAttachments2,
                            onImgContainerTap: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.uploadAttachmentModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: UploadAttachmentWidget(
                            isUser: false,
                            caption: 'This file is enough I think!',
                            attachment: AttachmentStruct(
                              url: 'https://',
                              sizeText: '148KB',
                              fileName: 'invoice',
                              fileExtension: FileExtension.ZIP,
                            ),
                            sender: UserStruct(
                              avatarUrl:
                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                            onDownload: () async {},
                          ),
                        ),
                        wrapWithModel(
                          model: _model.typingIndicatorModel,
                          updateCallback: () => safeSetState(() {}),
                          child: TypingIndicatorWidget(
                            hasAngledCorners: true,
                            sender: UserStruct(
                              avatarUrl:
                                  'https://images.unsplash.com/photo-1544005313-94ddf0286df2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxwZXJzb258ZW58MHx8fHwxNzQyODM4ODIxfDA&ixlib=rb-4.0.3&q=80&w=1080',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.messageInputModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MessageInputWidget(
                    hasAttachment: true,
                    hasCustomIcon: true,
                    customIcon: Icon(
                      Icons.bolt_rounded,
                    ),
                    customAction: () async {},
                    onSendMessage: (messageText) async {},
                    onTapAttachment: () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
