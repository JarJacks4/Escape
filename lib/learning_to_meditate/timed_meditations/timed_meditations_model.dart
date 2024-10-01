import '/flutter_flow/flutter_flow_util.dart';
import '/learning_to_meditate/meditation_carousel/meditation_carousel_widget.dart';
import '/meditation_and_sounds/environment_choice_carousel/environment_choice_carousel_widget.dart';
import '/meditation_and_sounds/time_carousel_copy/time_carousel_copy_widget.dart';
import 'timed_meditations_widget.dart' show TimedMeditationsWidget;
import 'package:flutter/material.dart';

class TimedMeditationsModel extends FlutterFlowModel<TimedMeditationsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for EnvironmentChoiceCarousel component.
  late EnvironmentChoiceCarouselModel environmentChoiceCarouselModel;
  // Model for TimeCarouselCopy component.
  late TimeCarouselCopyModel timeCarouselCopyModel;
  // Model for MeditationCarousel component.
  late MeditationCarouselModel meditationCarouselModel;

  @override
  void initState(BuildContext context) {
    environmentChoiceCarouselModel =
        createModel(context, () => EnvironmentChoiceCarouselModel());
    timeCarouselCopyModel = createModel(context, () => TimeCarouselCopyModel());
    meditationCarouselModel =
        createModel(context, () => MeditationCarouselModel());
  }

  @override
  void dispose() {
    environmentChoiceCarouselModel.dispose();
    timeCarouselCopyModel.dispose();
    meditationCarouselModel.dispose();
  }
}
