import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'soundscape_card_model.dart';
export 'soundscape_card_model.dart';

class SoundscapeCardWidget extends StatefulWidget {
  const SoundscapeCardWidget({
    super.key,
    String? genre,
    String? imgDesc,
    this.moodIcon,
    String? moodLabel,
    String? title,
  })  : this.genre = genre ?? 'Nature • 15 min',
        this.imgDesc = imgDesc ??
            'https://dimg.dreamflow.cloud/v1/image/misty%20pine%20forest%20in%20rain',
        this.moodLabel = moodLabel ?? 'Calm',
        this.title = title ?? 'Forest Rain';

  final String genre;
  final String imgDesc;
  final Widget? moodIcon;
  final String moodLabel;
  final String title;

  @override
  State<SoundscapeCardWidget> createState() => _SoundscapeCardWidgetState();
}

class _SoundscapeCardWidgetState extends State<SoundscapeCardWidget> {
  late SoundscapeCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SoundscapeCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  bool _isValidImageUrl(String url) {
    final uri = Uri.tryParse(url.trim());
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  Widget _imageFallback() {
    return Container(
      width: 180.0,
      height: 180.0,
      color: const Color(0x4439519F),
      alignment: Alignment.center,
      child: Icon(
        Icons.music_note_rounded,
        color: FlutterFlowTheme.of(context).primary,
        size: 32.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.imgDesc.trim();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: Container(
        child: Container(
          width: 180.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    children: [
                      if (_isValidImageUrl(imageUrl))
                        CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 0),
                          fadeOutDuration: Duration(milliseconds: 0),
                          imageUrl: imageUrl,
                          width: 180.0,
                          height: 180.0,
                          memCacheWidth: 360,
                          memCacheHeight: 360,
                          fit: BoxFit.cover,
                          alignment: Alignment(0.0, 0.0),
                          errorWidget: (context, error, stackTrace) =>
                              _imageFallback(),
                        )
                      else
                        _imageFallback(),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(9999.0),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 4.0,
                                  sigmaY: 4.0,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xCCFFFFFF),
                                    borderRadius: BorderRadius.circular(9999.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 4.0),
                                    child: Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          widget.moodIcon!,
                                          Text(
                                            valueOrDefault<String>(
                                              widget.moodLabel,
                                              'Calm',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.title,
                      'Forest Rain',
                    ),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget.genre,
                      'Nature • 15 min',
                    ),
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
                ].divide(SizedBox(height: 2.0)),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ),
    );
  }
}
