import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'voice_chat_lucille_model.dart';
export 'voice_chat_lucille_model.dart';

class VoiceChatLucilleWidget extends StatefulWidget {
  const VoiceChatLucilleWidget({super.key});

  static String routeName = 'VoiceChatLucille';
  static String routePath = 'voiceChatLucille';

  @override
  State<VoiceChatLucilleWidget> createState() => _VoiceChatLucilleWidgetState();
}

class _VoiceChatLucilleWidgetState extends State<VoiceChatLucilleWidget> {
  late VoiceChatLucilleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VoiceChatLucilleModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VoiceChatLucille'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VOICE_CHAT_LUCILLE_VoiceChatLucille_ON_I');
      logFirebaseEvent('VoiceChatLucille_request_permissions');
      await requestPermission(microphonePermission);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 874.73,
              decoration: BoxDecoration(),
              child: FlutterFlowWebView(
                content:
                    'https://streams.vagon.io/streams/ff9eea5c-d922-4467-9b18-d892255b10c3',
                bypass: true,
                height: MediaQuery.sizeOf(context).height * 1.0,
                verticalScroll: true,
                horizontalScroll: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
