import '/components/preview_stat_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movement_preview_modal5_new_widget.dart'
    show MovementPreviewModal5NewWidget;
import 'package:flutter/material.dart';

class MovementPreviewModal5NewModel
    extends FlutterFlowModel<MovementPreviewModal5NewWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for PreviewStat.
  late PreviewStatModel previewStatModel1;
  // Model for PreviewStat.
  late PreviewStatModel previewStatModel2;
  // Model for PreviewStat.
  late PreviewStatModel previewStatModel3;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    previewStatModel1 = createModel(context, () => PreviewStatModel());
    previewStatModel2 = createModel(context, () => PreviewStatModel());
    previewStatModel3 = createModel(context, () => PreviewStatModel());
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    previewStatModel1.dispose();
    previewStatModel2.dispose();
    previewStatModel3.dispose();
  }
}
