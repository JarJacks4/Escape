import '/components/track_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'could_i_get_page_widget.dart' show CouldIGetPageWidget;
import 'package:flutter/material.dart';

class CouldIGetPageModel extends FlutterFlowModel<CouldIGetPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnScrollController;
  // Model for TrackItem.
  late TrackItemModel trackItemModel1;
  // Model for TrackItem.
  late TrackItemModel trackItemModel2;
  // Model for TrackItem.
  late TrackItemModel trackItemModel3;
  // Model for TrackItem.
  late TrackItemModel trackItemModel4;
  // Model for TrackItem.
  late TrackItemModel trackItemModel5;
  // Model for TrackItem.
  late TrackItemModel trackItemModel6;
  // Model for TrackItem.
  late TrackItemModel trackItemModel7;
  // Model for TrackItem.
  late TrackItemModel trackItemModel8;
  // Model for TrackItem.
  late TrackItemModel trackItemModel9;
  // Model for TrackItem.
  late TrackItemModel trackItemModel10;
  // State field(s) for Row widget.
  ScrollController? rowScrollController;

  @override
  void initState(BuildContext context) {
    columnScrollController = ScrollController();
    trackItemModel1 = createModel(context, () => TrackItemModel());
    trackItemModel2 = createModel(context, () => TrackItemModel());
    trackItemModel3 = createModel(context, () => TrackItemModel());
    trackItemModel4 = createModel(context, () => TrackItemModel());
    trackItemModel5 = createModel(context, () => TrackItemModel());
    trackItemModel6 = createModel(context, () => TrackItemModel());
    trackItemModel7 = createModel(context, () => TrackItemModel());
    trackItemModel8 = createModel(context, () => TrackItemModel());
    trackItemModel9 = createModel(context, () => TrackItemModel());
    trackItemModel10 = createModel(context, () => TrackItemModel());
    rowScrollController = ScrollController();
  }

  @override
  void dispose() {
    columnScrollController?.dispose();
    trackItemModel1.dispose();
    trackItemModel2.dispose();
    trackItemModel3.dispose();
    trackItemModel4.dispose();
    trackItemModel5.dispose();
    trackItemModel6.dispose();
    trackItemModel7.dispose();
    trackItemModel8.dispose();
    trackItemModel9.dispose();
    trackItemModel10.dispose();
    rowScrollController?.dispose();
  }
}
