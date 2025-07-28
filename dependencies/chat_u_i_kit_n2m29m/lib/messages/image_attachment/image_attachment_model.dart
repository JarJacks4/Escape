import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/messages/image_attachment_container/image_attachment_container_widget.dart';
import 'dart:ui';
import 'image_attachment_widget.dart' show ImageAttachmentWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageAttachmentModel extends FlutterFlowModel<ImageAttachmentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ImageAttachmentContainer component.
  late ImageAttachmentContainerModel imageAttachmentContainerModel1;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel1;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel2;
  // Model for ImageAttachmentContainer component.
  late ImageAttachmentContainerModel imageAttachmentContainerModel2;

  @override
  void initState(BuildContext context) {
    imageAttachmentContainerModel1 =
        createModel(context, () => ImageAttachmentContainerModel());
    customAvatarModel1 = createModel(context, () => CustomAvatarModel());
    customAvatarModel2 = createModel(context, () => CustomAvatarModel());
    imageAttachmentContainerModel2 =
        createModel(context, () => ImageAttachmentContainerModel());
  }

  @override
  void dispose() {
    imageAttachmentContainerModel1.dispose();
    customAvatarModel1.dispose();
    customAvatarModel2.dispose();
    imageAttachmentContainerModel2.dispose();
  }
}
