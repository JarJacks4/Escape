import '/components/binaural_beats_a_d_h_d_widget.dart';
import '/components/binaural_beats_anxiety_relief_widget.dart';
import '/components/nature_sounds_page_comp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'binaural_beats_meditations_model.dart';
export 'binaural_beats_meditations_model.dart';

class BinauralBeatsMeditationsWidget extends StatefulWidget {
  const BinauralBeatsMeditationsWidget({super.key});

  static String routeName = 'BinauralBeatsMeditations';
  static String routePath = 'binauralBeatsMeditations';

  @override
  State<BinauralBeatsMeditationsWidget> createState() =>
      _BinauralBeatsMeditationsWidgetState();
}

class _BinauralBeatsMeditationsWidgetState
    extends State<BinauralBeatsMeditationsWidget> {
  late BinauralBeatsMeditationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BinauralBeatsMeditationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'BinauralBeatsMeditations'});
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
        appBar: responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        )
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: 100.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'y63r7jl4' /* Binaural Beats */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'The Seasons',
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                120.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'BINAURAL_BEATS_MEDITATIONS_Image_kzncjdu');
                                logFirebaseEvent('Image_navigate_to');

                                context.pushNamed(HomeVersion2Widget.routeName);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Logo_ESCAPE_DarkBlue.png',
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.352,
                                  height: 156.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: 671.7,
                        child: CarouselSlider(
                          items: [
                            wrapWithModel(
                              model: _model.natureSoundsPageCompModel,
                              updateCallback: () => safeSetState(() {}),
                              child: NatureSoundsPageCompWidget(),
                            ),
                            wrapWithModel(
                              model: _model.binauralBeatsAnxietyReliefModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BinauralBeatsAnxietyReliefWidget(),
                            ),
                            wrapWithModel(
                              model: _model.binauralBeatsADHDModel,
                              updateCallback: () => safeSetState(() {}),
                              child: BinauralBeatsADHDWidget(),
                            ),
                          ],
                          carouselController: _model.carouselController ??=
                              CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: 1,
                            viewportFraction: 0.8,
                            disableCenter: true,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.25,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: false,
                            onPageChanged: (index, _) =>
                                _model.carouselCurrentIndex = index,
                          ),
                        ),
                      ),
                    ),
                  ]
                      .addToStart(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
