import '/body_sections.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/app_state.dart';

/// The Body page's section picker: Yoga, Pilates, Tai Chi and Exercise.
/// Picking a section loads its moves into today's list, then opens the session start screen.
class BodySectionGrid extends StatelessWidget {
  const BodySectionGrid({super.key});

  void _open(BuildContext context, BodySection s) {
    HapticFeedback.lightImpact();
    FFAppState().update(() {
      bodyCategoryMoves = s.toStructs();
      FFAppState().todaysMoves = List.of(bodyCategoryMoves);
      FFAppState().hasPreviewedAMove = false;
    });
    context.pushNamed(
      BeginSessionPageWidget.routeName,
      queryParameters: {
        'currentIndex': serializeParam(kBodySections.indexOf(s), ParamType.int),
      }.withoutNulls,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.05,
        shrinkWrap: true,
        primary: false,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: kBodySections.map((s) {
          return Semantics(
            button: true,
            label: '${s.title}, ${s.moves.length} moves',
            child: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              onTap: () => _open(context, s),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x2DD0E3F7),
                  boxShadow: const [
                    BoxShadow(blurRadius: 10.0, color: Color(0x8FFCC462), spreadRadius: 0.0)
                  ],
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: const Color(0x38EDF1F7)),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: s.color.withOpacity(0.22),
                        border: Border.all(color: s.color.withOpacity(0.7)),
                      ),
                      child: Icon(s.icon, color: theme.primaryText, size: 26.0),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      s.title,
                      textAlign: TextAlign.center,
                      style: theme.bodyLarge.override(
                        font: GoogleFonts.cormorantSc(fontWeight: FontWeight.bold),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      '${s.moves.length} moves',
                      style: theme.bodySmall.override(
                        font: GoogleFonts.inter(),
                        color: theme.primary,
                        letterSpacing: 0.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      s.tagline,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.bodySmall.override(
                        font: GoogleFonts.inter(),
                        color: theme.secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
