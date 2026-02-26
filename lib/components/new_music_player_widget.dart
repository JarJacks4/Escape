import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'new_music_player_model.dart';
export 'new_music_player_model.dart';

class NewMusicPlayerWidget extends StatefulWidget {
  const NewMusicPlayerWidget({super.key});

  @override
  State<NewMusicPlayerWidget> createState() => _NewMusicPlayerWidgetState();
}

class _NewMusicPlayerWidgetState extends State<NewMusicPlayerWidget> {
  late NewMusicPlayerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewMusicPlayerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.985,
      decoration: BoxDecoration(
        color: Color(0xAAD0E3F7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Container-4.png',
          ).image,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 3.0,
            indent: 120.0,
            endIndent: 120.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ],
      ),
    );
  }
}
