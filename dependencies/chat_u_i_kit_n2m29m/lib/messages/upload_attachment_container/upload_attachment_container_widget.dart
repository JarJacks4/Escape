import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_attachment_container_model.dart';
export 'upload_attachment_container_model.dart';

/// Container for the UploadAttachment file preview, ideally this should not
/// be used by the user project.
class UploadAttachmentContainerWidget extends StatefulWidget {
  const UploadAttachmentContainerWidget({
    super.key,
    bool? isUser,
    this.caption,
    required this.attachment,
    required this.onDownload,
  }) : this.isUser = isUser ?? true;

  final bool isUser;
  final String? caption;
  final AttachmentStruct? attachment;
  final Future Function()? onDownload;

  @override
  State<UploadAttachmentContainerWidget> createState() =>
      _UploadAttachmentContainerWidgetState();
}

class _UploadAttachmentContainerWidgetState
    extends State<UploadAttachmentContainerWidget> {
  late UploadAttachmentContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadAttachmentContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(
          valueOrDefault<double>(
            widget!.isUser ? 1.0 : -1.0,
            0.0,
          ),
          -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            4.0,
            valueOrDefault<double>(
              utility_functions_library_8g4bud_app_constant
                  .FFAppConstants.padding8,
              0.0,
            ),
            4.0,
            valueOrDefault<double>(
              utility_functions_library_8g4bud_app_constant
                  .FFAppConstants.padding8,
              0.0,
            )),
        child: Material(
          color: Colors.transparent,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(valueOrDefault<double>(
                widget!.isUser ? 16.0 : 0.0,
                0.0,
              )),
              bottomRight: Radius.circular(valueOrDefault<double>(
                widget!.isUser ? 0.0 : 16.0,
                0.0,
              )),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  '',
                ).image,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(valueOrDefault<double>(
                  widget!.isUser ? 16.0 : 0.0,
                  0.0,
                )),
                bottomRight: Radius.circular(valueOrDefault<double>(
                  widget!.isUser ? 0.0 : 16.0,
                  0.0,
                )),
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          12.0, 12.0, 12.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) {
                                  if (widget!.attachment?.fileExtension ==
                                      FileExtension.PDF) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'packages/chat_u_i_kit_n2m29m/assets/images/pdf-file.png',
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (widget!
                                          .attachment?.fileExtension ==
                                      FileExtension.ZIP) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'packages/chat_u_i_kit_n2m29m/assets/images/zip.png',
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'packages/chat_u_i_kit_n2m29m/assets/images/file.png',
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.attachment?.fileName,
                                      'File',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.attachment?.sizeText,
                                      '0 KB',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                          FlutterFlowIconButton(
                            borderRadius: 8.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              FFIcons.kcloudDownload,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              await widget.onDownload?.call();
                            },
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                  if (widget!.caption != null && widget!.caption != '')
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          valueOrDefault<double>(
                            utility_functions_library_8g4bud_app_constant
                                .FFAppConstants.padding4,
                            0.0,
                          ),
                          0.0,
                          0.0,
                          0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.caption,
                          '[]',
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                      ),
                    ),
                ].divide(SizedBox(
                    height: utility_functions_library_8g4bud_app_constant
                        .FFAppConstants.padding8)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
