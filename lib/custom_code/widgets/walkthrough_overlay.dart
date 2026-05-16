// Automatic FlutterFlow imports
import '/backend/backend.dart';
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import "package:tiktokfeed_wz8en7/backend/schema/structs/index.dart"
    as tiktokfeed_wz8en7_data_schema;
import "package:utility_functions_library_8g4bud/backend/schema/structs/index.dart"
    as utility_functions_library_8g4bud_data_schema;
import "package:that_audio_player_oo85ab/backend/schema/structs/index.dart"
    as that_audio_player_oo85ab_data_schema;
import '/app_events/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class WalkthroughOverlay extends StatefulWidget {
  const WalkthroughOverlay({
    super.key,
    required this.width,
    required this.height,
    required this.onFinish,
  });

  final double width;
  final double height;
  final Future Function() onFinish;

  @override
  State<WalkthroughOverlay> createState() => _WalkthroughOverlayState();
}

class _WalkthroughOverlayState extends State<WalkthroughOverlay> {
  int currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {
      'title': 'Welcome to Escape',
      'description': 'Your personal wellness companion',
      'top': 80.0,
      'left': 0.0,
      'right': 0.0,
    },
    {
      'title': 'Scan Your Mood',
      'description': 'Start here every day to personalize your experience',
      'top': 220.0,
      'left': 0.0,
      'right': 0.0,
    },
    {
      'title': 'Explore',
      'description': 'Access Mind, Journal, Sounds, Body and Reset anytime',
      'top': 370.0,
      'left': 0.0,
      'right': 0.0,
    },
    {
      'title': 'Your Daily Path',
      'description': 'Lucille suggests personalized sessions just for you',
      'top': 480.0,
      'left': 0.0,
      'right': 0.0,
    },
    {
      'title': 'Track Your Progress',
      'description': 'See everything you have completed recently',
      'top': 620.0,
      'left': 0.0,
      'right': 0.0,
    },
  ];

  void nextStep() async {
    if (currentStep < steps.length - 1) {
      setState(() => currentStep++);
    } else {
      await widget.onFinish();
    }
  }

  void skip() async {
    await widget.onFinish();
  }

  @override
  Widget build(BuildContext context) {
    final step = steps[currentStep];

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Dark overlay
          Container(
            width: widget.width,
            height: widget.height,
            color: Colors.black.withOpacity(0.6),
          ),

          // Tooltip box
          Positioned(
            top: step['top'],
            left: 24,
            right: 24,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Container(
                key: ValueKey(currentStep),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Step indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${currentStep + 1} of ${steps.length}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        GestureDetector(
                          onTap: skip,
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    // Title
                    Text(
                      step['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2444),
                      ),
                    ),
                    SizedBox(height: 8),
                    // Description
                    Text(
                      step['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16),
                    // Next button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: nextStep,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1C2444),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(
                          currentStep < steps.length - 1
                              ? 'Next'
                              : 'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Dot indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        steps.length,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: currentStep == index ? 16 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentStep == index
                                ? Color(0xFF1C2444)
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
