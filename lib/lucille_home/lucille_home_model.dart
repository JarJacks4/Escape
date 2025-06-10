import '/components/change_your_avatar_widget.dart';
import '/components/chat_with_lucille_card_widget.dart';
import '/components/earn_points_with_avatar_card_widget.dart';
import '/components/generate_soundscapes_card_widget.dart';
import '/components/mood_tracking_card_widget.dart';
import '/components/progress_bar_final_widget.dart';
import '/components/self_care_routine_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'lucille_home_widget.dart' show LucilleHomeWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LucilleHomeModel extends FlutterFlowModel<LucilleHomeWidget> {
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
  // Model for progressBarFinal component.
  late ProgressBarFinalModel progressBarFinalModel;

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
    progressBarFinalModel = createModel(context, () => ProgressBarFinalModel());
  }

  @override
  void dispose() {
    chatWithLucilleCardModel.dispose();
    moodTrackingCardModel.dispose();
    generateSoundscapesCardModel.dispose();
    earnPointsWithAvatarCardModel.dispose();
    selfCareRoutineCardModel.dispose();
    changeYourAvatarModel.dispose();
    progressBarFinalModel.dispose();
  }
}
