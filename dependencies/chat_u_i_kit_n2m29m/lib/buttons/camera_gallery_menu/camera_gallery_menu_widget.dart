import '/buttons/context_menu_item/context_menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'camera_gallery_menu_model.dart';
export 'camera_gallery_menu_model.dart';

class CameraGalleryMenuWidget extends StatefulWidget {
  const CameraGalleryMenuWidget({
    super.key,
    this.textColor,
    required this.onTapTakePhoto,
    required this.onTapGallery,
  });

  final Color? textColor;
  final Future Function()? onTapTakePhoto;
  final Future Function()? onTapGallery;

  @override
  State<CameraGalleryMenuWidget> createState() =>
      _CameraGalleryMenuWidgetState();
}

class _CameraGalleryMenuWidgetState extends State<CameraGalleryMenuWidget> {
  late CameraGalleryMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraGalleryMenuModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.contextMenuItemModel1,
              updateCallback: () => safeSetState(() {}),
              child: ContextMenuItemWidget(
                icon: Icon(
                  Icons.camera_alt_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
                label: 'Take Photo',
                textColor: widget!.textColor!,
                isFirst: true,
                isLast: false,
                onTap: () async {
                  await widget.onTapTakePhoto?.call();
                },
              ),
            ),
            wrapWithModel(
              model: _model.contextMenuItemModel2,
              updateCallback: () => safeSetState(() {}),
              child: ContextMenuItemWidget(
                icon: Icon(
                  Icons.photo_outlined,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 20.0,
                ),
                label: 'Choose Photos',
                textColor: widget!.textColor!,
                isFirst: false,
                isLast: true,
                onTap: () async {
                  await widget.onTapGallery?.call();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
