import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import "package:that_slideable_list_item_mrpo3s/backend/schema/structs/index.dart"
    as that_slideable_list_item_mrpo3s_data_schema;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'lucille_first_recommendation_comp_model.dart';
export 'lucille_first_recommendation_comp_model.dart';

class LucilleFirstRecommendationCompWidget extends StatefulWidget {
  const LucilleFirstRecommendationCompWidget({super.key});

  @override
  State<LucilleFirstRecommendationCompWidget> createState() =>
      _LucilleFirstRecommendationCompWidgetState();
}

class _LucilleFirstRecommendationCompWidgetState
    extends State<LucilleFirstRecommendationCompWidget> {
  late LucilleFirstRecommendationCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LucilleFirstRecommendationCompModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserAgentStateRecord>>(
      stream: queryUserAgentStateRecord(
        queryBuilder: (userAgentStateRecord) => userAgentStateRecord.where(
          'userId',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 100.0,
              height: 100.0,
              child: SpinKitWave(
                color: FlutterFlowTheme.of(context).accent1,
                size: 100.0,
              ),
            ),
          );
        }
        List<UserAgentStateRecord> containerUserAgentStateRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerUserAgentStateRecord =
            containerUserAgentStateRecordList.isNotEmpty
                ? containerUserAgentStateRecordList.first
                : null;

        return Container(
          width: 320.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: Color(0x9BEDF1F7),
            image: DecorationImage(
              fit: BoxFit.none,
              image: Image.asset(
                'assets/images/Container_(6).png',
              ).image,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x80EDF1F7),
                offset: Offset(
                  0.0,
                  2.0,
                ),
                spreadRadius: 8.0,
              )
            ],
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '1ue27igb' /* CONTINUE YOUR JOURNEY */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'WorkSans',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            '92ij56or' /* Mind Energy Session */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'i2n01h55' /* 5 min remaining */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'WorkSans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                    FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: FFLocalizations.of(context).getText(
                        'x9kxlrcq' /* Resume */,
                      ),
                      options: FFButtonOptions(
                        height: 34.99,
                        padding: EdgeInsets.all(8.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'WorkSans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Color(0x39D0E3F7),
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: LinearPercentIndicator(
                        percent: 0.5,
                        width: 120.0,
                        lineHeight: 12.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).primary,
                        backgroundColor: FlutterFlowTheme.of(context).accent4,
                        center: Text(
                          FFLocalizations.of(context).getText(
                            'ed0591uz' /* 50% */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).primary,
                                fontSize: 5.0,
                                letterSpacing: 0.0,
                              ),
                          overflow: TextOverflow.fade,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 8.0)),
            ),
          ),
        );
      },
    );
  }
}
