import '/components/metric_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this component.

  String? newProfilePicture;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  AudioPlayer? soundPlayer1;
  AudioPlayer? soundPlayer2;
  bool isDataUploading_uploadDataTyq8 = false;
  FFUploadedFile uploadedLocalFile_uploadDataTyq8 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataTyq8 = '';

  // Model for MetricCard component.
  late MetricCardModel metricCardModel;
  // Model for AvgSleepCard.
  late MetricCardModel avgSleepCardModel;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  AudioPlayer? soundPlayer3;
  AudioPlayer? soundPlayer4;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    metricCardModel = createModel(context, () => MetricCardModel());
    avgSleepCardModel = createModel(context, () => MetricCardModel());
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    metricCardModel.dispose();
    avgSleepCardModel.dispose();
    columnController2?.dispose();
  }
}
