import '/components/voice_text_journaling_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_text_journaling_copy_widget.dart'
    show VoiceTextJournalingCopyWidget;
import 'package:flutter/material.dart';

class VoiceTextJournalingCopyModel
    extends FlutterFlowModel<VoiceTextJournalingCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VoiceTextJournalingComponent component.
  late VoiceTextJournalingComponentModel voiceTextJournalingComponentModel;

  @override
  void initState(BuildContext context) {
    voiceTextJournalingComponentModel =
        createModel(context, () => VoiceTextJournalingComponentModel());
  }

  @override
  void dispose() {
    voiceTextJournalingComponentModel.dispose();
  }
}
