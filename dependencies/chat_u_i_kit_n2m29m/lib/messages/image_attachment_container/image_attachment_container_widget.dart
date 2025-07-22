import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:utility_functions_library_8g4bud/flutter_flow/custom_functions.dart'
    as utility_functions_library_8g4bud_functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'image_attachment_container_model.dart';
export 'image_attachment_container_model.dart';

/// Container for the ImageAttachment image preview, ideally this should not
/// be used by the user project.
class ImageAttachmentContainerWidget extends StatefulWidget {
  const ImageAttachmentContainerWidget({
    super.key,
    required this.onImgContainerTap,
    bool? isUser,
    required this.imgAttachments,
    required this.imageContainerW,
    required this.imageContainerH,
  }) : this.isUser = isUser ?? false;

  final Future Function()? onImgContainerTap;
  final bool isUser;
  final List<AttachmentStruct>? imgAttachments;

  /// width for the whole image container
  final double? imageContainerW;

  /// height for the whole image container
  final double? imageContainerH;

  @override
  State<ImageAttachmentContainerWidget> createState() =>
      _ImageAttachmentContainerWidgetState();
}

class _ImageAttachmentContainerWidgetState
    extends State<ImageAttachmentContainerWidget> {
  late ImageAttachmentContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ImageAttachmentContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onImgContainerTap?.call();
      },
      child: Container(
        width: valueOrDefault<double>(
          widget!.imageContainerW,
          300.0,
        ),
        height: valueOrDefault<double>(
          widget!.imageContainerH,
          200.0,
        ),
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Builder(
            builder: (context) {
              if (widget!.imgAttachments?.length == 1) {
                return Align(
                  alignment: AlignmentDirectional(
                      valueOrDefault<double>(
                        widget!.isUser ? 1.0 : -1.0,
                        0.0,
                      ),
                      1.0),
                  child: Container(
                    width: widget!.imageContainerW,
                    height: widget!.imageContainerH,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(valueOrDefault<double>(
                          widget!.isUser ? 26.0 : 2.0,
                          0.0,
                        )),
                        bottomRight: Radius.circular(valueOrDefault<double>(
                          widget!.isUser ? 2.0 : 26.0,
                          0.0,
                        )),
                        topLeft: Radius.circular(26.0),
                        topRight: Radius.circular(26.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.network(
                              utility_functions_library_8g4bud_functions
                                  .convertStringToImagePath((widget!
                                          .imgAttachments
                                          ?.elementAtOrNull(0))
                                      ?.thumbnailUrl)!,
                            ).image,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(valueOrDefault<double>(
                              !widget!.isUser ? 2.0 : 26.0,
                              0.0,
                            )),
                            bottomRight: Radius.circular(valueOrDefault<double>(
                              widget!.isUser ? 2.0 : 26.0,
                              0.0,
                            )),
                            topLeft: Radius.circular(26.0),
                            topRight: Radius.circular(26.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              } else if (widget!.imgAttachments?.length == 2) {
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 26.0 : 2.0,
                        0.0,
                      )),
                      bottomRight: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 2.0 : 26.0,
                        0.0,
                      )),
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 2.0, 4.0),
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  utility_functions_library_8g4bud_functions
                                      .convertStringToImagePath((widget!
                                              .imgAttachments
                                              ?.elementAtOrNull(0))
                                          ?.thumbnailUrl)!,
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.isUser ? 26.0 : 2.0,
                                  0.0,
                                )),
                                bottomRight: Radius.circular(2.0),
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 4.0, 4.0, 4.0),
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  utility_functions_library_8g4bud_functions
                                      .convertStringToImagePath((widget!
                                              .imgAttachments
                                              ?.elementAtOrNull(1))
                                          ?.thumbnailUrl)!,
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(2.0),
                                bottomRight:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.isUser ? 2.0 : 26.0,
                                  0.0,
                                )),
                                topLeft: Radius.circular(2.0),
                                topRight: Radius.circular(26.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (widget!.imgAttachments?.length == 3) {
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 26.0 : 2.0,
                        0.0,
                      )),
                      bottomRight: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 2.0 : 26.0,
                        0.0,
                      )),
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 2.0, 4.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  utility_functions_library_8g4bud_functions
                                      .convertStringToImagePath((widget!
                                              .imgAttachments
                                              ?.elementAtOrNull(0))
                                          ?.thumbnailUrl)!,
                                ).image,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.isUser ? 26.0 : 2.0,
                                  0.0,
                                )),
                                bottomRight:
                                    Radius.circular(valueOrDefault<double>(
                                  widget!.isUser ? 2.0 : 26.0,
                                  0.0,
                                )),
                                topLeft: Radius.circular(26.0),
                                topRight: Radius.circular(2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 4.0, 4.0, 2.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        utility_functions_library_8g4bud_functions
                                            .convertStringToImagePath((widget!
                                                    .imgAttachments
                                                    ?.elementAtOrNull(1))
                                                ?.thumbnailUrl)!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2.0),
                                      bottomRight: Radius.circular(
                                          valueOrDefault<double>(
                                        widget!.isUser ? 2.0 : 26.0,
                                        0.0,
                                      )),
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(26.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 4.0, 4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        utility_functions_library_8g4bud_functions
                                            .convertStringToImagePath((widget!
                                                    .imgAttachments
                                                    ?.elementAtOrNull(2))
                                                ?.thumbnailUrl)!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2.0),
                                      bottomRight: Radius.circular(
                                          valueOrDefault<double>(
                                        widget!.isUser ? 2.0 : 26.0,
                                        0.0,
                                      )),
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 26.0 : 2.0,
                        0.0,
                      )),
                      bottomRight: Radius.circular(valueOrDefault<double>(
                        widget!.isUser ? 2.0 : 26.0,
                        0.0,
                      )),
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 2.0, 2.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        utility_functions_library_8g4bud_functions
                                            .convertStringToImagePath((widget!
                                                    .imgAttachments
                                                    ?.elementAtOrNull(0))
                                                ?.thumbnailUrl)!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2.0),
                                      bottomRight: Radius.circular(2.0),
                                      topLeft: Radius.circular(26.0),
                                      topRight: Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    4.0, 2.0, 2.0, 4.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        utility_functions_library_8g4bud_functions
                                            .convertStringToImagePath((widget!
                                                    .imgAttachments
                                                    ?.elementAtOrNull(1))
                                                ?.thumbnailUrl)!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(
                                          valueOrDefault<double>(
                                        widget!.isUser ? 26.0 : 2.0,
                                        0.0,
                                      )),
                                      bottomRight: Radius.circular(2.0),
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(2.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 4.0, 4.0, 2.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.network(
                                        utility_functions_library_8g4bud_functions
                                            .convertStringToImagePath((widget!
                                                    .imgAttachments
                                                    ?.elementAtOrNull(2))
                                                ?.thumbnailUrl)!,
                                      ).image,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(2.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(2.0),
                                      topRight: Radius.circular(26.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 4.0, 4.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.network(
                                              utility_functions_library_8g4bud_functions
                                                  .convertStringToImagePath(
                                                      (widget!.imgAttachments
                                                              ?.elementAtOrNull(
                                                                  3))
                                                          ?.thumbnailUrl)!,
                                            ).image,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(2.0),
                                            bottomRight: Radius.circular(
                                                valueOrDefault<double>(
                                              widget!.isUser ? 2.0 : 26.0,
                                              0.0,
                                            )),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (widget!.imgAttachments!.length > 4)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2.0, 2.0, 4.0, 4.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0x3A12151C),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(2.0),
                                              bottomRight: Radius.circular(
                                                  valueOrDefault<double>(
                                                widget!.isUser ? 2.0 : 26.0,
                                                0.0,
                                              )),
                                              topLeft: Radius.circular(2.0),
                                              topRight: Radius.circular(2.0),
                                            ),
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '+${utility_functions_library_8g4bud_functions.convertDoubleToInt(valueOrDefault<double>(
                                                  utility_functions_library_8g4bud_functions
                                                      .subtractTwoIntegers(
                                                          widget!
                                                              .imgAttachments!
                                                              .length
                                                              .toDouble(),
                                                          4.0),
                                                  0.0,
                                                ), 'round').toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
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
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
