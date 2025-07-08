import '/backend/backend.dart';
import '/components/change_your_avatar_widget.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/earn_points_with_avatar_card_widget.dart';
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

  // Model for ChatWithLucilleCard component.
  late ChatWithLucilleCardModel chatWithLucilleCardModel;
  // Model for MoodTrackingCard component.
  late MoodTrackingCardModel moodTrackingCardModel;
  // Model for GenerateSoundscapesCard component.
  late GenerateSoundscapesCardModel generateSoundscapesCardModel;
  // Model for EarnPointsWithAvatarCard component.
  late EarnPointsWithAvatarCardModel earnPointsWithAvatarCardModel;
  // Model for SelfCareRoutineCard component.
  late SelfCareRoutineCardModel selfCareRoutineCardModel;
  // Model for ChangeYourAvatar component.
  late ChangeYourAvatarModel changeYourAvatarModel;

  @override
  void initState(BuildContext context) {
    chatWithLucilleCardModel =
        createModel(context, () => ChatWithLucilleCardModel());
    moodTrackingCardModel = createModel(context, () => MoodTrackingCardModel());
    generateSoundscapesCardModel =
        createModel(context, () => GenerateSoundscapesCardModel());
    earnPointsWithAvatarCardModel =
        createModel(context, () => EarnPointsWithAvatarCardModel());
    selfCareRoutineCardModel =
        createModel(context, () => SelfCareRoutineCardModel());
    changeYourAvatarModel = createModel(context, () => ChangeYourAvatarModel());
  }

  @override
  void dispose() {
    chatWithLucilleCardModel.dispose();
    moodTrackingCardModel.dispose();
    generateSoundscapesCardModel.dispose();
    earnPointsWithAvatarCardModel.dispose();
    selfCareRoutineCardModel.dispose();
    changeYourAvatarModel.dispose();
  }
}
