import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/messages/upload_attachment_container/upload_attachment_container_widget.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'upload_attachment_widget.dart' show UploadAttachmentWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadAttachmentModel extends FlutterFlowModel<UploadAttachmentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for UploadAttachmentContainer component.
  late UploadAttachmentContainerModel uploadAttachmentContainerModel1;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel1;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel2;
  // Model for UploadAttachmentContainer component.
  late UploadAttachmentContainerModel uploadAttachmentContainerModel2;

  @override
  void initState(BuildContext context) {
    uploadAttachmentContainerModel1 =
        createModel(context, () => UploadAttachmentContainerModel());
    customAvatarModel1 = createModel(context, () => CustomAvatarModel());
    customAvatarModel2 = createModel(context, () => CustomAvatarModel());
    uploadAttachmentContainerModel2 =
        createModel(context, () => UploadAttachmentContainerModel());
  }

  @override
  void dispose() {
    uploadAttachmentContainerModel1.dispose();
    customAvatarModel1.dispose();
    customAvatarModel2.dispose();
    uploadAttachmentContainerModel2.dispose();
  }
}
