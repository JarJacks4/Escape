import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_therapist_directory_model.dart';
export 'header_therapist_directory_model.dart';

class HeaderTherapistDirectoryWidget extends StatefulWidget {
  const HeaderTherapistDirectoryWidget({super.key});

  @override
  State<HeaderTherapistDirectoryWidget> createState() =>
      _HeaderTherapistDirectoryWidgetState();
}

class _HeaderTherapistDirectoryWidgetState
    extends State<HeaderTherapistDirectoryWidget> {
  late HeaderTherapistDirectoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderTherapistDirectoryModel());
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
      decoration: BoxDecoration(
        color: Color(0x00FCFFF9),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 44.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 200.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.menu_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 36.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 52.0,
                      fillColor: FlutterFlowTheme.of(context).alternate,
                      icon: Icon(
                        Icons.notifications,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 36.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 22.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'HEADER_THERAPIST_DIRECTORY_userAvatar_ON');
                        logFirebaseEvent('userAvatar_drawer');
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        width: 60.0,
                        height: 60.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1611590027211-b954fd027b51?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1338&q=80',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '99iu8x7v' /* Therapist Directory */,
                    ),
                    style: FlutterFlowTheme.of(context).displaySmall.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 24.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  '75pewyb9' /* Start or continue your journey... */,
                ),
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Roboto',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).secondary,
            ),
          ],
        ),
      ),
    );
  }
}
