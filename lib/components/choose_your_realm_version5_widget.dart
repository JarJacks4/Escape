import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'choose_your_realm_version5_model.dart';
export 'choose_your_realm_version5_model.dart';

/// New Component Gen
class ChooseYourRealmVersion5Widget extends StatefulWidget {
  const ChooseYourRealmVersion5Widget({super.key});

  @override
  State<ChooseYourRealmVersion5Widget> createState() =>
      _ChooseYourRealmVersion5WidgetState();
}

class _ChooseYourRealmVersion5WidgetState
    extends State<ChooseYourRealmVersion5Widget> with TickerProviderStateMixin {
  late ChooseYourRealmVersion5Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseYourRealmVersion5Model());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlutterFlowIconButton(
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.chevron_left,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'CHOOSE_YOUR_REALM_VERSION5_chevron_left_');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.safePop();
                  },
                ),
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AuthUserStreamWidget(
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.network(
                        currentUserPhoto,
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '5g1gqo1p' /* Choose Your Realm */,
                  ),
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'hsbht736' /* Mood-Tinted Worlds Await */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'WorkSans',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      isScrollable: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'WorkSans',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'WorkSans',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                              ),
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                      unselectedBackgroundColor: Color(0x86EDF1F7),
                      borderColor: FlutterFlowTheme.of(context).primary,
                      borderWidth: 2.0,
                      borderRadius: 25.0,
                      elevation: 3.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                      buttonMargin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(15.0),
                      tabs: [
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            '7i193c66' /* Theme: Nature */,
                          ),
                          iconMargin: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'oqbrl9hd' /* Mood: Calm */,
                          ),
                        ),
                        Tab(
                          text: FFLocalizations.of(context).getText(
                            'a6q6o8h2' /* Energy Low */,
                          ),
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => SingleChildScrollView(
                            controller: _model.columnController1,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 667.32,
                                  decoration: BoxDecoration(),
                                  child: MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    itemCount: 8,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return [
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1503435824048-a799a3a84bf7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjcyOTh8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1567374578224-b57c510ddbf3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjcyOTl8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1435820394963-a15297f976fd?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjcyOTl8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1600211906168-fbc6df476b1c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjcyOTl8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1547235002-edab0f7f1395?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjczMDB8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1507484467459-0c01be16726e?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjczMDB8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1516553386477-13b2294c5896?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjczMDB8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1523057530100-383d7fbc77a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjczMDF8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      ][index]();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    width: 292.02,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF9F9F9),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 16.0, 16.0, 16.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0u7w802f' /* Based on your mood, 
try a blo... */
                                          ,
                                        ),
                                        textAlign: TextAlign.justify,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'WorkSans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 25.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '2pv36od1' /* Enter Selected Realm */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => SingleChildScrollView(
                            primary: false,
                            controller: _model.columnController2,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    itemCount: 8,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return [
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1533162507191-d90c625b2640?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxjYWxtJTIwfGVufDB8fHx8MTc2NTU2NzUyN3ww&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1527380992061-b126c88cbb41?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxjYWxtfGVufDB8fHx8MTc2NTU2NzUzOXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1474540412665-1cdae210ae6b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxjYWxtfGVufDB8fHx8MTc2NTU2NzUzOXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/reserve/YEc7WB6ASDydBTw6GDlF_antalya-beach-lulu.jpg?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8Y2FsbXxlbnwwfHx8fDE3NjU1Njc1Mzl8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1522075782449-e45a34f1ddfb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyNHx8Y2FsbXxlbnwwfHx8fDE3NjU1Njc1Mzl8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1483354483454-4cd359948304?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8Y2FsbXxlbnwwfHx8fDE3NjU1Njc1Mzl8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1493815793585-d94ccbc86df8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxOHx8Y2FsbXxlbnwwfHx8fDE3NjU1Njc1Mzl8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1523057530100-383d7fbc77a1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjU1NjczMDF8&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      ][index]();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 292.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 16.0, 16.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'jk66xt7f' /* Based on your mood, 
try a blo... */
                                            ,
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 25.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'faz7q0xr' /* Enter Selected Realm */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => SingleChildScrollView(
                            primary: false,
                            controller: _model.columnController3,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: MasonryGridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    itemCount: 8,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return [
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1499399814141-542cbd57935b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxsb3clMjBlbmVyZ3l8ZW58MHx8fHwxNzY1NTY3NjAxfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1605973031453-df862b327ac0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxNHx8bG93JTIwZW5lcmd5fGVufDB8fHx8MTc2NTU2NzYwMXww&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1555686100-5249aa93874f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxsb3clMjBlbmVyZ3l8ZW58MHx8fHwxNzY1NTY3NjAxfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1528353518104-dbd48bee7bc4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxuaWdodCUyMHNreXxlbnwwfHx8fDE3NjU0ODM0MjF8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1481988535861-271139e06469?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw2fHxzdW5zZXR8ZW58MHx8fHwxNzY1NTA5OTEyfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1470252649378-9c29740c9fa8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw3fHxzdW5zZXR8ZW58MHx8fHwxNzY1NTA5OTEyfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1610296669228-602fa827fc1f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxzcGFjZXxlbnwwfHx8fDE3NjU1MTM4MzJ8MA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        () => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1608178398319-48f814d0750c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8c3BhY2V8ZW58MHx8fHwxNzY1NTEzODMyfDA&ixlib=rb-4.1.0&q=80&w=1080',
                                                width: 150.0,
                                                height: 150.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                      ][index]();
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 292.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16.0),
                                          topRight: Radius.circular(16.0),
                                          bottomRight: Radius.circular(16.0),
                                        ),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 16.0, 16.0, 16.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'p2c7h5yn' /* Based on your mood, 
try a blo... */
                                            ,
                                          ),
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'WorkSans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      25.0, 25.0, 25.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () {
                                      print('Button pressed ...');
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'wgzji6fc' /* Enter Selected Realm */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsets.all(8.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'WorkSans',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
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
          ].divide(SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
