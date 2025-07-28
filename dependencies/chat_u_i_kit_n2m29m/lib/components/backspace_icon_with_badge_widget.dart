import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'backspace_icon_with_badge_model.dart';
export 'backspace_icon_with_badge_model.dart';

/// Displays a backspace-style icon with an optional badge to indicate unread
/// notifications.
class BackspaceIconWithBadgeWidget extends StatefulWidget {
  const BackspaceIconWithBadgeWidget({
    super.key,
    int? notificationsCount,
    this.badgeColor,
  }) : this.notificationsCount = notificationsCount ?? 0;

  /// The number of notifications to display inside the badge.
  ///
  /// Set to 0 to hide the badge, or any positive number to show the badge with
  /// a count.
  final int notificationsCount;

  final Color? badgeColor;

  @override
  State<BackspaceIconWithBadgeWidget> createState() =>
      _BackspaceIconWithBadgeWidgetState();
}

class _BackspaceIconWithBadgeWidgetState
    extends State<BackspaceIconWithBadgeWidget> {
  late BackspaceIconWithBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackspaceIconWithBadgeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Container(
        width: 40.0,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 36.0,
              ),
            ),
            if (widget!.notificationsCount > 0)
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      widget!.badgeColor,
                      FlutterFlowTheme.of(context).secondary,
                    ),
                    shape: BoxShape.circle,
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget!.notificationsCount.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
