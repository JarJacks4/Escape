import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_intro_comp_copy_widget.dart'
    show OnboardingIntroCompCopyWidget;
import 'package:flutter/material.dart';

class OnboardingIntroCompCopyModel
    extends FlutterFlowModel<OnboardingIntroCompCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
