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
import 'home_page_widget.dart' show HomePageWidget;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackspaceIconWithBadge component.
  late BackspaceIconWithBadgeModel backspaceIconWithBadgeModel;
  // Model for CustomAvatar component.
  late CustomAvatarModel customAvatarModel;
  // Model for UploadAttachment component.
  late UploadAttachmentModel uploadAttachmentModel1;
  // Model for TextMessage component.
  late TextMessageModel textMessageModel1;
  // Model for ImageAttachment component.
  late ImageAttachmentModel imageAttachmentModel1;
  // Model for ImageAttachment component.
  late ImageAttachmentModel imageAttachmentModel2;
  // Model for TextMessage component.
  late TextMessageModel textMessageModel2;
  // Model for ImageAttachment component.
  late ImageAttachmentModel imageAttachmentModel3;
  // Model for UploadAttachment component.
  late UploadAttachmentModel uploadAttachmentModel2;
  // Model for TypingIndicator component.
  late TypingIndicatorModel typingIndicatorModel;
  // Model for MessageInput component.
  late MessageInputModel messageInputModel;

  @override
  void initState(BuildContext context) {
    backspaceIconWithBadgeModel =
        createModel(context, () => BackspaceIconWithBadgeModel());
    customAvatarModel = createModel(context, () => CustomAvatarModel());
    uploadAttachmentModel1 =
        createModel(context, () => UploadAttachmentModel());
    textMessageModel1 = createModel(context, () => TextMessageModel());
    imageAttachmentModel1 = createModel(context, () => ImageAttachmentModel());
    imageAttachmentModel2 = createModel(context, () => ImageAttachmentModel());
    textMessageModel2 = createModel(context, () => TextMessageModel());
    imageAttachmentModel3 = createModel(context, () => ImageAttachmentModel());
    uploadAttachmentModel2 =
        createModel(context, () => UploadAttachmentModel());
    typingIndicatorModel = createModel(context, () => TypingIndicatorModel());
    messageInputModel = createModel(context, () => MessageInputModel());
  }

  @override
  void dispose() {
    backspaceIconWithBadgeModel.dispose();
    customAvatarModel.dispose();
    uploadAttachmentModel1.dispose();
    textMessageModel1.dispose();
    imageAttachmentModel1.dispose();
    imageAttachmentModel2.dispose();
    textMessageModel2.dispose();
    imageAttachmentModel3.dispose();
    uploadAttachmentModel2.dispose();
    typingIndicatorModel.dispose();
    messageInputModel.dispose();
  }
}
