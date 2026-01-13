import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'community_app_bar_model.dart';
export 'community_app_bar_model.dart';

class CommunityAppBarWidget extends StatefulWidget {
  const CommunityAppBarWidget({super.key});

  @override
  State<CommunityAppBarWidget> createState() => _CommunityAppBarWidgetState();
}

class _CommunityAppBarWidgetState extends State<CommunityAppBarWidget> {
  late CommunityAppBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityAppBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://images.unsplash.com/photo-1542685295-b280fd4d2c59?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHJhbmRvbXx8fHx8fHx8fDE3NjgyNDczMzd8&ixlib=rb-4.1.0&q=80&w=1080',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'ctkpzkh5' /* @escapeuser */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'WorkSans',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '7hosghxq' /* Shared their ritual journey */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'WorkSans',
                            color: Color(0xCCFFFFFF),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: FFLocalizations.of(context).getText(
                  'ho9i3iiu' /* Follow */,
                ),
                options: FFButtonOptions(
                  height: 32.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x66FFFFFF),
                  textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
