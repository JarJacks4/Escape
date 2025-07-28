import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/messages/image_attachment_container/image_attachment_container_widget.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_attachment_model.dart';
export 'image_attachment_model.dart';

class ImageAttachmentWidget extends StatefulWidget {
  const ImageAttachmentWidget({
    super.key,
    required this.onImgContainerTap,
    bool? isUser,
    required this.imgAttachments,
    double? imageContainerW,
    double? imageContainerH,
    required this.sender,
  })  : this.isUser = isUser ?? false,
        this.imageContainerW = imageContainerW ?? 300.0,
        this.imageContainerH = imageContainerH ?? 200.0;

  final Future Function()? onImgContainerTap;

  /// Is the sender object the current user?
  final bool isUser;

  final List<AttachmentStruct>? imgAttachments;

  /// width for the whole image container
  final double imageContainerW;

  /// height for the whole image container
  final double imageContainerH;

  /// the User object for the current user
  final UserStruct? sender;

  @override
  State<ImageAttachmentWidget> createState() => _ImageAttachmentWidgetState();
}

class _ImageAttachmentWidgetState extends State<ImageAttachmentWidget> {
  late ImageAttachmentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageAttachmentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Builder(
        builder: (context) {
          if (widget!.isUser) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        valueOrDefault<double>(
                          utility_functions_library_8g4bud_app_constant
                              .FFAppConstants.padding4,
                          0.0,
                        ),
                        0.0),
                    child: wrapWithModel(
                      model: _model.imageAttachmentContainerModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: ImageAttachmentContainerWidget(
                        isUser: widget!.isUser,
                        imageContainerW: widget!.imageContainerW,
                        imageContainerH: widget!.imageContainerH,
                        imgAttachments: widget!.imgAttachments!,
                        onImgContainerTap: () async {},
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.customAvatarModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAvatarWidget(
                          showOnlineStatus: false,
                          isSmallSize: true,
                          sender: widget!.sender!,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      wrapWithModel(
                        model: _model.customAvatarModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomAvatarWidget(
                          showOnlineStatus: false,
                          isSmallSize: true,
                          sender: widget!.sender!,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 1.0),
                  child: wrapWithModel(
                    model: _model.imageAttachmentContainerModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: ImageAttachmentContainerWidget(
                      isUser: widget!.isUser,
                      imageContainerW: valueOrDefault<double>(
                        widget!.imageContainerW,
                        200.0,
                      ),
                      imageContainerH: valueOrDefault<double>(
                        widget!.imageContainerH,
                        100.0,
                      ),
                      imgAttachments: widget!.imgAttachments!,
                      onImgContainerTap: () async {},
                    ),
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
