import '/components/button4_widget.dart';
import '/components/voice_text_journaling_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'voice_text_journaling_widget.dart' show VoiceTextJournalingWidget;
import 'package:flutter/material.dart';

class VoiceTextJournalingModel
    extends FlutterFlowModel<VoiceTextJournalingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for VoiceTextJournalingComponent component.
  late VoiceTextJournalingComponentModel voiceTextJournalingComponentModel;
  // Model for Button.
  late Button4Model buttonModel;

  @override
  void initState(BuildContext context) {
    voiceTextJournalingComponentModel =
        createModel(context, () => VoiceTextJournalingComponentModel());
    buttonModel = createModel(context, () => Button4Model());
  }

  @override
  void dispose() {
    voiceTextJournalingComponentModel.dispose();
    buttonModel.dispose();
  }
}
