import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'lucille_voice_chat_web_view_model.dart';
export 'lucille_voice_chat_web_view_model.dart';

class LucilleVoiceChatWebViewWidget extends StatefulWidget {
  const LucilleVoiceChatWebViewWidget({super.key});

  static String routeName = 'LucilleVoiceChatWebView';
  static String routePath = '/lucilleVoiceChatWebView';

  @override
  State<LucilleVoiceChatWebViewWidget> createState() =>
      _LucilleVoiceChatWebViewWidgetState();
}

class _LucilleVoiceChatWebViewWidgetState
    extends State<LucilleVoiceChatWebViewWidget> {
  late LucilleVoiceChatWebViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleVoiceChatWebViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'LucilleVoiceChatWebView'});
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
        body: Stack(
          fit: StackFit.expand,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                if (!constraints.hasBoundedWidth ||
                    !constraints.hasBoundedHeight ||
                    constraints.maxWidth <= 0.0 ||
                    constraints.maxHeight <= 0.0) {
                  return const SizedBox.shrink();
                }

                return FlutterFlowWebView(
                  content:
                      'https://streams.vagon.io/streams/997c79bc-b2e6-49ad-818e-3b64bbc57213',
                  bypass: true,
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  verticalScroll: true,
                  horizontalScroll: true,
                );
              },
            ),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: InkWell(
                    onTap: () => context.safePop(),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
