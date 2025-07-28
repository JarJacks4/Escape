import '/buttons/context_menu_item/context_menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'camera_gallery_menu_widget.dart' show CameraGalleryMenuWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CameraGalleryMenuModel extends FlutterFlowModel<CameraGalleryMenuWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ContextMenuItem component.
  late ContextMenuItemModel contextMenuItemModel1;
  // Model for ContextMenuItem component.
  late ContextMenuItemModel contextMenuItemModel2;

  @override
  void initState(BuildContext context) {
    contextMenuItemModel1 = createModel(context, () => ContextMenuItemModel());
    contextMenuItemModel2 = createModel(context, () => ContextMenuItemModel());
  }

  @override
  void dispose() {
    contextMenuItemModel1.dispose();
    contextMenuItemModel2.dispose();
  }
}
