import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_upload_comp_model.dart';
export 'video_upload_comp_model.dart';

class VideoUploadCompWidget extends StatefulWidget {
  const VideoUploadCompWidget({super.key});

  @override
  State<VideoUploadCompWidget> createState() => _VideoUploadCompWidgetState();
}

class _VideoUploadCompWidgetState extends State<VideoUploadCompWidget> {
  late VideoUploadCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoUploadCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 885.13,
      decoration: BoxDecoration(
        color: Color(0xFF0A0F19),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.CustomCameraWidget(
          width: double.infinity,
          height: double.infinity,
          backgroundColor: Color(0xFF0D111F),
          cameraIndex: 1,
        ),
      ),
    );
  }
}
