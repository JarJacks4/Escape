import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_with_lucille_unreal_page_model.dart';
export 'chat_with_lucille_unreal_page_model.dart';

class ChatWithLucilleUnrealPageWidget extends StatefulWidget {
  const ChatWithLucilleUnrealPageWidget({super.key});

  static String routeName = 'ChatWithLucilleUnrealPage';
  static String routePath = 'chatWithLucilleUnrealPage';

  @override
  State<ChatWithLucilleUnrealPageWidget> createState() =>
      _ChatWithLucilleUnrealPageWidgetState();
}

class _ChatWithLucilleUnrealPageWidgetState
    extends State<ChatWithLucilleUnrealPageWidget> {
  late ChatWithLucilleUnrealPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatWithLucilleUnrealPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ChatWithLucilleUnrealPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CHAT_WITH_LUCILLE_UNREAL_ChatWithLucille');
      logFirebaseEvent('ChatWithLucilleUnrealPage_request_permis');
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
