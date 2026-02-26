import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'contact_us_part2_model.dart';
export 'contact_us_part2_model.dart';

/// New Component Gen
class ContactUsPart2Widget extends StatefulWidget {
  const ContactUsPart2Widget({super.key});

  @override
  State<ContactUsPart2Widget> createState() => _ContactUsPart2WidgetState();
}

class _ContactUsPart2WidgetState extends State<ContactUsPart2Widget> {
  late ContactUsPart2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContactUsPart2Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFB19CD9), Color(0xFF9BB5FF)],
            stops: [0.0, 1.0],
            begin: AlignmentDirectional(0.0, -1.0),
            end: AlignmentDirectional(0, 1.0),
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '5372goy3' /* Send us a message */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'The Seasons',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'r2i2oq7t' /* Subject */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        'g6p7cph7' /* Technical Issue */,
                      ),
                      FFLocalizations.of(context).getText(
                        'npuhi9fc' /* Billing Question */,
                      ),
                      FFLocalizations.of(context).getText(
                        'fsdedr2o' /* Feature Request */,
                      ),
                      FFLocalizations.of(context).getText(
                        'x454wrtn' /* Other */,
                      )
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.dropDownValue = val),
                    width: double.infinity,
                    height: 50.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          letterSpacing: 0.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      'vkhxm33b' /* Technical Issue */,
                    ),
                    fillColor: Colors.white,
                    elevation: 0.0,
                    borderColor: Color(0x00000000),
                    borderWidth: 0.0,
                    borderRadius: 12.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'wrw1gwbd' /* Email */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'uhbl3qa6' /* your.email@example.com */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'WorkSans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            letterSpacing: 0.0,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ufq5o537' /* Message */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.textController2,
                      focusNode: _model.textFieldFocusNode2,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: FFLocalizations.of(context).getText(
                          'qxd5xzf4' /* Describe your issue or questio... */,
                        ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'WorkSans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            letterSpacing: 0.0,
                          ),
                      maxLines: 8,
                      minLines: 6,
                      validator:
                          _model.textController2Validator.asValidator(context),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'ybon3rkl' /* Attachments (optional) */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Color(0xFFE0E0E0),
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_file,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'nais2749' /* Add attachment file */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  't8kro09y' /* Send Message */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFFFF9A8B),
                  textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'fffffoky' /* Looking for quick answers? */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      'ecy11pi9' /* Browse FAQ */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF8E7CC3),
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'WorkSans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
