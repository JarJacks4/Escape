// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'dart:async';

class Swipeable extends StatefulWidget {
  const Swipeable({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<Swipeable> createState() => _SwipeableState();
}

class _SwipeableState extends State<Swipeable> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton.expand(
            duration: const Duration(milliseconds: 200),
            thumb: const Icon(
              Icons.double_arrow_rounded,
              color: Colors.white,
            ),
            activeThumbColor: Colors.red,
            activeTrackColor: Colors.grey.shade300,
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton(
            trackPadding: const EdgeInsets.all(6),
            elevationThumb: 2,
            elevationTrack: 2,
            child: const Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton(
            thumbPadding: const EdgeInsets.all(3),
            thumb: const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            elevationThumb: 2,
            elevationTrack: 2,
            child: Text(
              "Swipe to ...".toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton(
            borderRadius: BorderRadius.circular(8),
            activeTrackColor: Colors.amber,
            height: 60,
            child: const Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton(
            activeTrackColor: Colors.blue,
            activeThumbColor: Colors.yellow,
            borderRadius: BorderRadius.zero,
            height: 30,
            child: const Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 12,
          ),
          child: SwipeButton(
            width: 200,
            child: const Text(
              "Swipe to ...",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onSwipe: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Swipped"),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
