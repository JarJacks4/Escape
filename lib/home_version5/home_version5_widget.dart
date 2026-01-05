import '/backend/api_requests/api_calls.dart';
import '/components/new_home_version5_widget.dart';
import '/components/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:that_audio_player_5bjqer/app_state.dart'
    as that_audio_player_5bjqer_app_state;
import 'package:tiktokfeed_wz8en7/app_state.dart'
    as tiktokfeed_wz8en7_app_state;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_version5_model.dart';
export 'home_version5_model.dart';

class HomeVersion5Widget extends StatefulWidget {
  const HomeVersion5Widget({super.key});

  static String routeName = 'HomeVersion5';
  static String routePath = 'homeVersion5';

  @override
  State<HomeVersion5Widget> createState() => _HomeVersion5WidgetState();
}

class _HomeVersion5WidgetState extends State<HomeVersion5Widget> {
  late HomeVersion5Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeVersion5Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'HomeVersion5'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_VERSION5_HomeVersion5_ON_INIT_STATE');
      logFirebaseEvent('HomeVersion5_backend_call');
      _model.createSession =
          await LucilleStreamingGroup.createNewSessionCall.call();

      logFirebaseEvent('HomeVersion5_update_app_state');
      FFAppState().chatSessionId =
          LucilleStreamingGroup.createNewSessionCall.sessionID(
        (_model.createSession?.jsonBody ?? ''),
      )!;
      FFAppState().update(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    context.watch<tiktokfeed_wz8en7_app_state.FFAppState>();
    context.watch<that_audio_player_5bjqer_app_state.FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sideNavModel,
              updateCallback: () => safeSetState(() {}),
              child: SideNavWidget(),
            ),
          ),
        ),
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? PreferredSize(
                preferredSize: Size.fromHeight(70.0),
                child: AppBar(
                  backgroundColor: Color(0xFFFCFCFC),
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 60.0,
                          icon: Icon(
                            FFIcons.khamburgerMenu,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 36.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOME_VERSION5_hamburgerMenu_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_drawer');
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 90.47,
                            height: 43.1,
                            decoration: BoxDecoration(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Logo_ESCAPE_DarkBlue.png',
                                width: 55.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [],
                  centerTitle: true,
                  toolbarHeight: 75.0,
                  elevation: 3.0,
                ),
              )
            : null,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 815.48,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).primary,
                            FlutterFlowTheme.of(context).secondary
                          ],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.0, -1.0),
                          end: AlignmentDirectional(0, 1.0),
                        ),
                      ),
                      child: wrapWithModel(
                        model: _model.newHomeVersion5Model,
                        updateCallback: () => safeSetState(() {}),
                        child: NewHomeVersion5Widget(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
