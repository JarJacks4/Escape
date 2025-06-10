import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'avatar_creation_unreal_page_model.dart';
export 'avatar_creation_unreal_page_model.dart';

class AvatarCreationUnrealPageWidget extends StatefulWidget {
  const AvatarCreationUnrealPageWidget({super.key});

  static String routeName = 'AvatarCreationUnrealPage';
  static String routePath = 'avatarCreationUnrealPage';

  @override
  State<AvatarCreationUnrealPageWidget> createState() =>
      _AvatarCreationUnrealPageWidgetState();
}

class _AvatarCreationUnrealPageWidgetState
    extends State<AvatarCreationUnrealPageWidget> {
  late AvatarCreationUnrealPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AvatarCreationUnrealPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AvatarCreationUnrealPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('AVATAR_CREATION_UNREAL_AvatarCreationUnr');
      logFirebaseEvent('AvatarCreationUnrealPage_request_permiss');
      await requestPermission(cameraPermission);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
      ),
    );
  }
}
