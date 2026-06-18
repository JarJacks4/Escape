import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_comp1_model.dart';
export 'new_comp1_model.dart';

/// New Component Gen
class NewComp1Widget extends StatefulWidget {
  const NewComp1Widget({super.key});

  @override
  State<NewComp1Widget> createState() => _NewComp1WidgetState();
}

class _NewComp1WidgetState extends State<NewComp1Widget> {
  late NewComp1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewComp1Model());
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
        child: SingleChildScrollView(
          controller: _model.columnController,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.arrow_back,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'i6pg9jxp' /* How are you feeling? */,
                        ),
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.cormorantSc(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 16.0)),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'q6bi50v2' /* Take a moment to check in with... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'hm7ebph9' /* Positive */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).accent3,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '87gs1gej' /* Happy */,
                              ),
                              FFIcons.kemojiSmileyHappyFace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'yqfrj7n9' /* Excited */,
                              ),
                              FontAwesomeIcons.exclamation),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'l75chsbq' /* Peaceful */,
                              ),
                              FontAwesomeIcons.peace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'b12f6xqd' /* Confident */,
                              ),
                              FFIcons.kinnerConflict),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '4yfl1uma' /* Loved */,
                              ),
                              Icons.favorite),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'ixfybr29' /* Grateful */,
                              ),
                              Icons.celebration)
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.choiceChipsValues1 = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: FlutterFlowTheme.of(context).accent3,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 18.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xA7D0E3F7),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 16.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 50.0,
                        rowSpacing: 15.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues1 != null,
                        alignment: WrapAlignment.spaceAround,
                        controller: _model.choiceChipsValueController1 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      '8y1c4q4o' /* Neutral */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'bx25o8bd' /* Okay */,
                              ),
                              FFIcons.kthumbUp),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '2vt8uftr' /* Thoughtful */,
                              ),
                              FFIcons.kbrain),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'o9iclfnl' /* Tired */,
                              ),
                              FFIcons.ktired),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '17qlhokr' /* Content */,
                              ),
                              FFIcons.kcontact)
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.choiceChipsValues2 = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).secondary,
                          iconSize: 18.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xCDD0E3F7),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 16.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 50.0,
                        rowSpacing: 15.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues2 != null,
                        alignment: WrapAlignment.spaceAround,
                        controller: _model.choiceChipsValueController2 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'pdyu1ok5' /* Stressed */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).error,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'orhwc37o' /* Anxious */,
                              ),
                              FFIcons.kemojiSmileyHappyFace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '1o61hc1e' /* Frustrated */,
                              ),
                              FontAwesomeIcons.exclamation),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'knktawa1' /* Nervous */,
                              ),
                              FontAwesomeIcons.peace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'eueax11r' /* Overwhelmed */,
                              ),
                              FFIcons.kinnerConflict)
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.choiceChipsValues3 = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xDAE65454),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).primary,
                          iconSize: 18.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xCDD0E3F7),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 16.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 50.0,
                        rowSpacing: 15.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues3 != null,
                        alignment: WrapAlignment.spaceAround,
                        controller: _model.choiceChipsValueController3 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'jnkcxzyj' /* Heavy */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FlutterFlowChoiceChips(
                        options: [
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'wbi0p0uu' /* Sad */,
                              ),
                              FFIcons.kemojiSmileyHappyFace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'gy8yjzu7' /* Disappointed */,
                              ),
                              FontAwesomeIcons.exclamation),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                '4qizygt1' /* Lonely */,
                              ),
                              FontAwesomeIcons.peace),
                          ChipData(
                              FFLocalizations.of(context).getText(
                                'qaugnxen' /* Worried */,
                              ),
                              FFIcons.kinnerConflict)
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.choiceChipsValues4 = val),
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          iconColor: FlutterFlowTheme.of(context).secondary,
                          iconSize: 18.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xCDD0E3F7),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).tertiary,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                          iconColor: FlutterFlowTheme.of(context).alternate,
                          iconSize: 16.0,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        chipSpacing: 50.0,
                        rowSpacing: 15.0,
                        multiselect: true,
                        initialized: _model.choiceChipsValues4 != null,
                        alignment: WrapAlignment.spaceAround,
                        controller: _model.choiceChipsValueController4 ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        wrapped: true,
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: FFLocalizations.of(context).getText(
                      '6wngkkpu' /* Continue */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.all(8.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).accent1,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'xw6g1bqr' /* Your mood helps us personalize... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                ),
              ),
            ].divide(SizedBox(height: 24.0)),
          ),
        ),
      ),
    );
  }
}
