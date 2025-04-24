// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChewieWidget extends StatefulWidget {
  const ChewieWidget({
    super.key,
    this.width,
    this.height,
    required this.data,
    required this.userID,
    required this.likerebuidpage,
    required this.bookedrebuidpage,
  });

  final double? width;
  final double? height;
  final String userID;
  final List<TiktokPageStruct> data;
  final Future Function() likerebuidpage;
  final Future Function() bookedrebuidpage;

  @override
  _ChewieWidgetState createState() => _ChewieWidgetState();
}

class _ChewieWidgetState extends State<ChewieWidget> {
  List<Video> _videos = [];
  List<Video2> _videoss = [];

  int _currentIndex = 0;
  bool _showPlayIcon = true;
  bool lastValue = true;
  String? lastvid;
  bool _isActive = true;
  Timer? _timer;
  bool once = true;
  bool once1 = true;

  @override
  void initState() {
    _initializeVideos();

    super.initState();
  }

  void _initializeVideos() async {
    _videos = widget.data
        .map((video) => Video(
              id: video.id,
              user: video.profilename ?? 'John',
              userPic: video.userPicture ??
                  'https://res.cloudinary.com/dcato1y8g/image/upload/v1701558081/People_Circle18_ss1xia.png',
              url: video.urlvideo ??
                  'https://res.cloudinary.com/dl6aqq2yy/video/upload/v1676307765/Y2Mate.is_-_Liv_Scholar_Profile_V2-SuOziaSoq9U-1080p-1656887559897_n1uvyp.mp4',
            ))
        .toList();

    _videoss = widget.data
        .map((video) => Video2(
              likes: video.likes,
              bookmarked: video.bookmark,
            ))
        .toList();

    for (var video in _videos) {
      await video.initializeController();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _videoss = widget.data
        .map((video) => Video2(
              likes: video.likes,
              bookmarked: video.bookmark,
            ))
        .toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        itemCount: _videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return videoCard(_videos[index], _videoss[index], index);
        },
        onPageChanged: (index) {
          if (_currentIndex != index) {
            _videos[_currentIndex].controller?.pause();
          }
          _currentIndex = index;
          _videos[_currentIndex].controller?.play();
          _showPlayIcon = true;
        },
      ),
    );
  }

  Widget videoCard(Video video, Video2 videoo, int index) {
    GlobalKey<_HeartState> heart = GlobalKey<_HeartState>();
    GlobalKey<_ActionsToolbarState> actionsToolbar =
        GlobalKey<_ActionsToolbarState>();
    if (index == 0 && once == true) {
      Future.delayed(Duration(milliseconds: 2000), () {
        video.controller!.play();
      });
      once = false;
    }
    void _deactivateListener() {
      setState(() {
        _isActive = false;
      });
      _timer?.cancel();
      _timer = Timer(Duration(milliseconds: 700), () {
        setState(() {
          _isActive = true;
        });
      });
    }

    video.controller!.addListener(() {
      if (!_isActive) return;
      if (lastvid != video.controller!.dataSource) {
        lastvid = video.controller!.dataSource;
        _deactivateListener();
        return;
      }
      if (video.controller!.value.isPlaying && (lastValue != true)) {
        setState(() {
          lastValue = video.controller!.value.isPlaying;
          _showPlayIcon = true;
          lastvid = video.controller!.dataSource;
        });
      } else if ((video.controller!.value.isPlaying == false) &&
          (lastValue != false)) {
        setState(() {
          lastValue = video.controller!.value.isPlaying;
          _showPlayIcon = false;
          lastvid = video.controller!.dataSource;
        });
      }
    });

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (video.controller!.value.isPlaying) {
              video.controller?.pause();
            } else {
              video.controller?.play();
            }
          },
          onDoubleTap: () {
            heart.currentState?.startAnimation();
          },
          child: AbsorbPointer(
            child: Center(
              child: SizedBox(
                width: video.controller?.value.size.width ?? 0,
                height: video.controller?.value.size.height ?? 0,
                child: Container(
                    child: Stack(children: [
                  VideoPlayer(video.controller!),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          VideoDescription(video.user),
                        ],
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ])),
              ),
            ),
          ),
        ),
        if (!_showPlayIcon)
          Center(
            child: Icon(
              Icons.play_arrow,
              size: 100,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        Center(
            child: Heart(
          key: heart,
          actionsToolbar: actionsToolbar,
          likeMethod: widget.likerebuidpage,
          userID: widget.userID,
          videoid: video.id,
        )),
        Align(
          alignment: Alignment.centerRight,
          child: ActionsToolbar(
            key: actionsToolbar,
            videoID: video.id,
            numLikes: videoo.likes,
            bookmark: videoo.bookmarked,
            userPic: video.userPic,
            userID: widget.userID,
            likerebuidpage: widget.likerebuidpage,
            bookedrebuidpage: widget.bookedrebuidpage,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    for (var video in _videos) {
      video.controller?.dispose();
    }
    super.dispose();
  }
}

class Heart extends StatefulWidget {
  const Heart(
      {super.key,
      required this.likeMethod,
      required this.userID,
      required this.actionsToolbar,
      required this.videoid});
  final Future Function() likeMethod;
  final GlobalKey<_ActionsToolbarState> actionsToolbar;
  final String userID;
  final int videoid;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  startAnimation() async {
    await _controller.forward();
    await _controller.reverse();
    widget.actionsToolbar.currentState?.like();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Opacity(
              opacity: 1,
              child: Icon(
                Icons.favorite,
                size: _controller.value * 180,
                color: Colors.red,
              ));
        });
  }
}

class Video {
  int id;
  String user;
  String userPic;
  String url;

  VideoPlayerController? controller;

  Video({
    required this.id,
    required this.user,
    required this.userPic,
    required this.url,
  });

  Video.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user = json['user'],
        userPic = json['user_pic'],
        //likes = List<String>.from(json['likes'].map((x) => x.toString())),
        url = json['url']
  //bookmarked =List<String>.from(json['bookmarked'].map((x) => x.toString())
  ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['user_pic'] = this.userPic;
    //data['likes'] = this.likes.map((x) => x.toString()).toList();
    data['url'] = this.url;

    //data['bookmarked'] = this.bookmarked.map((x) => x.toString()).toList();

    return data;
  }

  Future<void> initializeController() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await controller!.initialize();
    controller!.setLooping(true);
  }
}

class Video2 {
  List<String> likes;
  List<String> bookmarked;

  VideoPlayerController? controller;

  Video2({
    required this.likes,
    required this.bookmarked,
  });

  Video2.fromJson(Map<String, dynamic> json)
      : likes = List<String>.from(json['likes'].map((x) => x.toString())),
        bookmarked =
            List<String>.from(json['bookmarked'].map((x) => x.toString()));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['likes'] = this.likes.map((x) => x.toString()).toList();

    data['bookmarked'] = this.bookmarked.map((x) => x.toString()).toList();

    return data;
  }

  Future<void> initializeController() async {
    await controller!.initialize();
  }
}

class VideoDescription extends StatelessWidget {
  final username;

  VideoDescription(this.username);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                '@' + username,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
            ]));
  }
}

class ActionsToolbar extends StatefulWidget {
  const ActionsToolbar({
    super.key,
    required this.numLikes,
    required this.bookmark,
    required this.userPic,
    required this.userID,
    required this.likerebuidpage,
    required this.bookedrebuidpage,
    required this.videoID,
  });

  final List<String> numLikes;
  final List<String> bookmark;
  final String userPic;
  final String userID;
  final Future Function() likerebuidpage;
  final Future Function() bookedrebuidpage;
  final int videoID;

  @override
  State<ActionsToolbar> createState() => _ActionsToolbarState();
}

class _ActionsToolbarState extends State<ActionsToolbar> {
  late bool isBookmarked;
  late bool isLiked;
  late List<String> currentLikes;
  late List<String> currentBookmarks;

  @override
  void initState() {
    super.initState();
    currentLikes = List<String>.from(widget.numLikes);
    currentBookmarks = List<String>.from(widget.bookmark);
    isLiked = widget.numLikes.contains(widget.userID);
    isBookmarked = widget.bookmark.contains(widget.userID);
  }

  void like() {
    if (!isLiked) {
      setState(() {
        isLiked = true;
        currentLikes.add(widget.userID);
        FFAppState().newListLike = currentLikes;

        FFAppState().videoID = widget.videoID;
        FFAppState().isLiked = isLiked;
        widget.likerebuidpage();
      });
    }
  }

  void toggleLike() {
    if (isLiked) {
      isLiked = false;
      currentLikes.remove(widget.userID);
    } else {
      isLiked = true;
      currentLikes.add(widget.userID);
    }

    FFAppState().newListLike = currentLikes;

    FFAppState().videoID = widget.videoID;
    FFAppState().isLiked = isLiked;
    widget.likerebuidpage();
  }

  void toggleBookmark() {
    setState(() {
      if (isBookmarked) {
        isBookmarked = false;
        currentBookmarks.remove(widget.userID);
      } else {
        isBookmarked = true;
        currentBookmarks.add(widget.userID);
      }
    });

    FFAppState().newListBookmarks = currentBookmarks;

    FFAppState().videoID = widget.videoID;
    FFAppState().isBookmarked = isBookmarked;

    widget.bookedrebuidpage();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 200.0,
      decoration: const BoxDecoration(
        color: Color(0x38000000),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Align(
        alignment: const AlignmentDirectional(1.0, 0.0),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(widget.userPic, fit: BoxFit.cover),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: isLiked
                          ? Colors.red
                          : FlutterFlowTheme.of(context).alternate,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: isLiked
                          ? Colors.red
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.white : Colors.black,
                        size: 24.0,
                      ),
                      onPressed: toggleLike,
                    ),
                    SizedBox(height: 2.5),
                    Text(
                      currentLikes.length.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: FlutterFlowIconButton(
                    borderColor: isBookmarked
                        ? Colors.yellow
                        : FlutterFlowTheme.of(context).alternate,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 40.0,
                    fillColor: isBookmarked
                        ? Colors.yellow
                        : FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked
                          ? Colors.white
                          : FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: toggleBookmark,
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

class FlutterFlowIconButton extends StatefulWidget {
  const FlutterFlowIconButton({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.disabledColor,
    this.disabledIconColor,
    this.hoverColor,
    this.hoverIconColor,
    this.onPressed,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;
  final double? buttonSize;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final Function()? onPressed;

  @override
  State<FlutterFlowIconButton> createState() => _FlutterFlowIconButtonState();
}

class _FlutterFlowIconButtonState extends State<FlutterFlowIconButton> {
  bool loading = false;
  late double? iconSize;
  late Color? iconColor;
  late Widget effectiveIcon;

  @override
  void initState() {
    super.initState();
    _updateIcon();
  }

  @override
  void didUpdateWidget(FlutterFlowIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateIcon();
  }

  void _updateIcon() {
    final isFontAwesome = widget.icon is FaIcon;
    if (isFontAwesome) {
      FaIcon icon = widget.icon as FaIcon;
      effectiveIcon = FaIcon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    } else {
      Icon icon = widget.icon as Icon;
      effectiveIcon = Icon(
        icon.icon,
        size: icon.size,
      );
      iconSize = icon.size;
      iconColor = icon.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            side: BorderSide(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 0,
            ),
          );
        },
      ),
      iconColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.disabledIconColor != null) {
            return widget.disabledIconColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.hoverIconColor != null) {
            return widget.hoverIconColor;
          }
          return iconColor;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.disabledColor != null) {
            return widget.disabledColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.hoverColor != null) {
            return widget.hoverColor;
          }

          return widget.fillColor;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return null;
        }
        return widget.hoverColor == null ? null : Colors.transparent;
      }),
    );

    return SizedBox(
      width: widget.buttonSize,
      height: widget.buttonSize,
      child: Theme(
        data: ThemeData.from(
          colorScheme: Theme.of(context).colorScheme,
          useMaterial3: true,
        ),
        child: IgnorePointer(
          ignoring: (widget.showLoadingIndicator && loading),
          child: IconButton(
            icon: (widget.showLoadingIndicator && loading)
                ? Container(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        iconColor ?? Colors.white,
                      ),
                    ),
                  )
                : effectiveIcon,
            onPressed: widget.onPressed == null
                ? null
                : () async {
                    if (loading) {
                      return;
                    }
                    setState(() => loading = true);
                    try {
                      await widget.onPressed!();
                    } finally {
                      if (mounted) {
                        setState(() => loading = false);
                      }
                    }
                  },
            splashRadius: widget.buttonSize,
            style: style,
          ),
        ),
      ),
    );
  }
}
