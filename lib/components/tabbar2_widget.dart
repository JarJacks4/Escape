import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'tabbar2_model.dart';
export 'tabbar2_model.dart';

class Tabbar2Widget extends StatefulWidget {
  const Tabbar2Widget({super.key});

  @override
  State<Tabbar2Widget> createState() => _Tabbar2WidgetState();
}

class _Tabbar2WidgetState extends State<Tabbar2Widget>
    with TickerProviderStateMixin {
  late Tabbar2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Tabbar2Model());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(-1.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment(1.0, 0),
              child: FlutterFlowButtonTabBar(
                useToggleButtonStyle: false,
                isScrollable: true,
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'WorkSans',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
                unselectedLabelStyle: TextStyle(),
                labelColor: Colors.white,
                unselectedLabelColor:
                    FlutterFlowTheme.of(context).secondaryText,
                backgroundColor: FlutterFlowTheme.of(context).primaryText,
                unselectedBackgroundColor: Color(0xFFF1F1F1),
                borderColor: Color(0x00FFFFFF),
                unselectedBorderColor: Color(0x00FFFFFF),
                borderWidth: 0.0,
                borderRadius: 10.0,
                elevation: 0.0,
                labelPadding:
                    EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                buttonMargin:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                tabs: [
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'sycy9eot' /* This week */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'cqycy5zi' /* This quarter */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      '1u1vo6jk' /* All time */,
                    ),
                  ),
                  Tab(
                    text: FFLocalizations.of(context).getText(
                      'zxbc9fl4' /* Custom Value */,
                    ),
                  ),
                ],
                controller: _model.tabBarController,
                onTap: (i) async {
                  [() async {}, () async {}, () async {}, () async {}][i]();
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _model.tabBarController,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'swq0dqx6' /* This week */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'h4z0nzi5' /* this quarter */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'w10jk0nf' /* All time */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'l77brlgd' /* Custom Value */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
