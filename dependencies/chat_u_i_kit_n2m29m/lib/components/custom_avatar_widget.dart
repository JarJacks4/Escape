import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_avatar_model.dart';
export 'custom_avatar_model.dart';

class CustomAvatarWidget extends StatefulWidget {
  const CustomAvatarWidget({
    super.key,
    bool? showOnlineStatus,
    bool? isSmallSize,
    required this.sender,
  })  : this.showOnlineStatus = showOnlineStatus ?? false,
        this.isSmallSize = isSmallSize ?? false;

  final bool showOnlineStatus;
  final bool isSmallSize;
  final UserStruct? sender;

  @override
  State<CustomAvatarWidget> createState() => _CustomAvatarWidgetState();
}

class _CustomAvatarWidgetState extends State<CustomAvatarWidget> {
  late CustomAvatarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomAvatarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            0.0,
            0.0,
            valueOrDefault<double>(
              utility_functions_library_8g4bud_app_constant
                  .FFAppConstants.padding8,
              0.0,
            ),
            0.0),
        child: Container(
          width: widget!.isSmallSize ? 41.0 : 55.0,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                  child: Container(
                    width: valueOrDefault<double>(
                      widget!.isSmallSize ? 36.0 : 50.0,
                      45.0,
                    ),
                    height: valueOrDefault<double>(
                      widget!.isSmallSize ? 36.0 : 50.0,
                      45.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          widget!.sender!.avatarUrl,
                        ).image,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              if (widget!.showOnlineStatus)
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Container(
                    width: 16.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        (widget!.sender?.status == UserStatus.ONLINE) ||
                                (widget!.sender?.status == UserStatus.TYPING)
                            ? FlutterFlowTheme.of(context).tertiary
                            : FlutterFlowTheme.of(context).alternate,
                        FlutterFlowTheme.of(context).alternate,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
