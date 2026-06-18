import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'glass_card_model.dart';
export 'glass_card_model.dart';

class GlassCardWidget extends StatefulWidget {
  const GlassCardWidget({
    super.key,
    this.child,
  });

  final Widget Function()? child;

  @override
  State<GlassCardWidget> createState() => _GlassCardWidgetState();
}

class _GlassCardWidgetState extends State<GlassCardWidget> {
  late GlassCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GlassCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x66FFFFFF),
                  borderRadius: BorderRadius.circular(28.0),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0x4DFFFFFF),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Container(
                    child: Builder(builder: (_) {
                      return widget.child != null
                          ? widget.child!()
                          : SizedBox.shrink();
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
