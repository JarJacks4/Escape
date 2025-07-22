import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/messages/upload_attachment_container/upload_attachment_container_widget.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_attachment_model.dart';
export 'upload_attachment_model.dart';

/// Use this component for showing file previews such as PDF, ZIP and allow
/// users to download the files using the onDownload action.
class UploadAttachmentWidget extends StatefulWidget {
  const UploadAttachmentWidget({
    super.key,
    bool? isUser,
    this.caption,
    required this.attachment,
    required this.onDownload,
    required this.sender,
  }) : this.isUser = isUser ?? true;

  final bool isUser;
  final String? caption;
  final AttachmentStruct? attachment;
  final Future Function()? onDownload;
  final UserStruct? sender;

  @override
  State<UploadAttachmentWidget> createState() => _UploadAttachmentWidgetState();
}

class _UploadAttachmentWidgetState extends State<UploadAttachmentWidget> {
  late UploadAttachmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadAttachmentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          if (widget!.isUser) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                wrapWithModel(
                  model: _model.uploadAttachmentContainerModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: UploadAttachmentContainerWidget(
                    isUser: widget!.isUser,
                    caption: widget!.caption,
                    attachment: widget!.attachment!,
                    onDownload: () async {
                      await widget.onDownload?.call();
                    },
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          4.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            utility_functions_library_8g4bud_app_constant
                                .FFAppConstants.padding8,
                            0.0,
                          )),
                      child: wrapWithModel(
                        model: _model.customAvatarModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAvatarWidget(
                          showOnlineStatus: false,
                          isSmallSize: true,
                          sender: widget!.sender!,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          4.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            utility_functions_library_8g4bud_app_constant
                                .FFAppConstants.padding8,
                            0.0,
                          )),
                      child: wrapWithModel(
                        model: _model.customAvatarModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAvatarWidget(
                          showOnlineStatus: false,
                          isSmallSize: true,
                          sender: widget!.sender!,
                        ),
                      ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.uploadAttachmentContainerModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: UploadAttachmentContainerWidget(
                    isUser: widget!.isUser,
                    caption: widget!.caption,
                    attachment: widget!.attachment!,
                    onDownload: () async {
                      await widget.onDownload?.call();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
