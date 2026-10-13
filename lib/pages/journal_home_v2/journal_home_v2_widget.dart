import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'journal_home_v2_model.dart';
export 'journal_home_v2_model.dart';

class JournalHomeV2Widget extends StatefulWidget {
  const JournalHomeV2Widget({
    super.key,
    this.screen,
    this.mode,
  });

  final String? screen;
  final String? mode;

  static String routeName = 'JournalHomeV2';
  static String routePath = '/journalHomeV2';

  @override
  State<JournalHomeV2Widget> createState() => _JournalHomeV2WidgetState();
}

class _JournalHomeV2WidgetState extends State<JournalHomeV2Widget> {
  late JournalHomeV2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalHomeV2Model());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'JournalHomeV2'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: const Color(0xFF0B1230),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.EscapeJournalV2(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    initialScreen: widget.screen,
                    initialMode: widget.mode,
                    onClose: () async {
                      logFirebaseEvent(
                          'JOURNAL_HOME_V2_Container_0vzg3m5a_CALLB');
                      logFirebaseEvent('EscapeJournalV2_navigate_back');
                      context.safePop();
                    },
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
