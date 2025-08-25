import '/backend/backend.dart';
import '/components/change_your_avatar_widget.dart';
import '/components/escape_innerverse_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/self_care_routine_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'lucille_home_widget.dart' show LucilleHomeWidget;
import 'package:flutter/material.dart';

class LucilleHomeModel extends FlutterFlowModel<LucilleHomeWidget> {
  ///  Local state fields for this page.

  UsersRecord? profilePicture;

  ///  State fields for stateful widgets in this page.

  // Model for GenerateSoundscapesCard component.
  late GenerateSoundscapesCardModel generateSoundscapesCardModel;
  // Model for MoodTrackingCard component.
  late MoodTrackingCardModel moodTrackingCardModel;
  // Model for EscapeInnerverseCard component.
  late EscapeInnerverseCardModel escapeInnerverseCardModel;
  // Model for SelfCareRoutineCard component.
  late SelfCareRoutineCardModel selfCareRoutineCardModel;
  // Model for ChangeYourAvatar component.
  late ChangeYourAvatarModel changeYourAvatarModel;

  @override
  void initState(BuildContext context) {
    generateSoundscapesCardModel =
        createModel(context, () => GenerateSoundscapesCardModel());
    moodTrackingCardModel = createModel(context, () => MoodTrackingCardModel());
    escapeInnerverseCardModel =
        createModel(context, () => EscapeInnerverseCardModel());
    selfCareRoutineCardModel =
        createModel(context, () => SelfCareRoutineCardModel());
    changeYourAvatarModel = createModel(context, () => ChangeYourAvatarModel());
  }

  @override
  void dispose() {
    generateSoundscapesCardModel.dispose();
    moodTrackingCardModel.dispose();
    escapeInnerverseCardModel.dispose();
    selfCareRoutineCardModel.dispose();
    changeYourAvatarModel.dispose();
  }
}
