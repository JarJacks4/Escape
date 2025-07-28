import '/backend/schema/structs/index.dart';
import '/components/custom_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:utility_functions_library_8g4bud/app_constants.dart'
    as utility_functions_library_8g4bud_app_constant;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'typing_indicator_model.dart';
export 'typing_indicator_model.dart';

/// Typing indicator for the incoming message.
class TypingIndicatorWidget extends StatefulWidget {
  const TypingIndicatorWidget({
    super.key,
    required this.sender,
    bool? hasAngledCorners,
  }) : this.hasAngledCorners = hasAngledCorners ?? true;

  final UserStruct? sender;
  final bool hasAngledCorners;

  @override
  State<TypingIndicatorWidget> createState() => _TypingIndicatorWidgetState();
}

class _TypingIndicatorWidgetState extends State<TypingIndicatorWidget> {
  late TypingIndicatorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TypingIndicatorModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: AlignmentDirectional(-1.0, 1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              wrapWithModel(
                model: _model.customAvatarModel,
                updateCallback: () => safeSetState(() {}),
                child: CustomAvatarWidget(
                  showOnlineStatus: false,
                  isSmallSize: true,
                  sender: widget!.sender!,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(valueOrDefault<double>(
                widget!.hasAngledCorners ? 2.0 : 26.0,
                0.0,
              )),
              bottomRight: Radius.circular(26.0),
              topLeft: Radius.circular(26.0),
              topRight: Radius.circular(26.0),
            ),
          ),
          child: Lottie.asset(
            'packages/chat_u_i_kit_n2m29m/assets/jsons/TypingGray.json',
            width: 140.0,
            height: 200.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
      ],
    );
  }
}
