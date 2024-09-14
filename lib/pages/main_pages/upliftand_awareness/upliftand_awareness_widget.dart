import '/components/uplift_and_awareness_sounds_comp/uplift_and_awareness_sounds_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upliftand_awareness_model.dart';
export 'upliftand_awareness_model.dart';

class UpliftandAwarenessWidget extends StatefulWidget {
  const UpliftandAwarenessWidget({super.key});

  @override
  State<UpliftandAwarenessWidget> createState() =>
      _UpliftandAwarenessWidgetState();
}

class _UpliftandAwarenessWidgetState extends State<UpliftandAwarenessWidget> {
  late UpliftandAwarenessModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpliftandAwarenessModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'UpliftandAwareness'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1523250217488-ab35967e9840?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8Y2FsbSUyMHdoaXRlJTIwYmFja2dyb3VuZHxlbnwwfHx8fDE3MjExMzQ3ODF8MA&ixlib=rb-4.0.3&q=80&w=1080',
                    ).image,
                  ),
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFCFFFFFF), Colors.white],
                      stops: [0.5, 0.7],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.network(
                                'https://images.unsplash.com/photo-1597119162008-7e9d0ca2bd95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx1cGxpZnR8ZW58MHx8fHwxNzI1MzQzOTE5fDA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: double.infinity,
                                height: 250.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                height: 200.0,
                                decoration: BoxDecoration(),
                              ),
                              Container(
                                width: 393.0,
                                height: 252.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0x83FFFFFF),
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground
                                    ],
                                    stops: [0.2, 1.0],
                                    begin: AlignmentDirectional(0.0, -1.0),
                                    end: AlignmentDirectional(0, 1.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 40.0, 15.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor: Color(0xB5E7C8E7),
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'UPLIFTAND_AWARENESS_chevron_left_ICN_ON_');
                                        logFirebaseEvent(
                                            'IconButton_navigate_back');
                                        context.safePop();
                                      },
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      height: MediaQuery.sizeOf(context).width *
                                          0.2,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/ESCAPE_Logo_Clear.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 22.0, 0.0, 2.0),
                                            child: SelectionArea(
                                                child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '9xtv6tqj' /* Uplift and Awareness */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 36.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: wrapWithModel(
                model: _model.upliftAndAwarenessSoundsCompModel,
                updateCallback: () => safeSetState(() {}),
                child: UpliftAndAwarenessSoundsCompWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
