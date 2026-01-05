import '/auth/firebase_auth/auth_util.dart';
import '/backend/ai_agents/ai_agent.dart';
import '/components/mood_weather_version5_comp_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'advanced_mood_tracker_model.dart';
export 'advanced_mood_tracker_model.dart';

class AdvancedMoodTrackerWidget extends StatefulWidget {
  const AdvancedMoodTrackerWidget({super.key});

  static String routeName = 'AdvancedMoodTracker';
  static String routePath = 'advancedMoodTracker';

  @override
  State<AdvancedMoodTrackerWidget> createState() =>
      _AdvancedMoodTrackerWidgetState();
}

class _AdvancedMoodTrackerWidgetState extends State<AdvancedMoodTrackerWidget>
    with TickerProviderStateMixin {
  late AdvancedMoodTrackerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvancedMoodTrackerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AdvancedMoodTracker'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ADVANCED_MOOD_TRACKER_AdvancedMoodTracke');
      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'Write a warm, emotionally safe message acknowledging the user\'s mood in the MoodHistory doscuments and CurrentMood Image URL \"{CurrentMood}\". \nMatch this tone and length exactly:\n\n\"I notice you\'re feeling a bit overwhelmed today. That\'s completely okay. These feelings are temporary and you\'re not alone. Let\'s find a gentle way to support you right now.\"\n\nRequirements:\n- 205–235 characters total\n- One short paragraph\n- Same gentle, supportive tone\n- No markdown, no bold, no asterisks, no emojis\n- No lists\n- No overly long sentences\n- Output text only',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '2',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.lucilleMessage = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'You are analyzing the user\'s emotional state using BOTH their uploaded photo and their selected mood inputs.\n\nFIRST, analyze the image (base64 provided in \"image\" field) to infer emotional cues such as facial tension, softness, calmness, stress indicators, or emotional neutrality.\n\nTHEN combine your image-based emotional scan with these user-selected inputs:\nMood: \"{mood}\"\nEnergy: \"{energy}\"\nFocus: \"{focus}\"\nTone: \"{tone}\"\n\nYour task:\n\n1. Produce FOUR single-word emotional interpretations, each representing the category choicechips from the pervious page:\n   - Positive category → one word only (e.g. “Hopeful”, “Centered”, “Grounded”)\n   - Neutral category → one word only (e.g. “Reflective”, “Steady”, “Even”)\n   - Stressed category → one word only (e.g. “Tense”, “On-Edge”, “Overloaded”)\n   - Heavy category → one word only (e.g. “Drained”, “Weighted”, “Overwhelmed”)\n\nRules for these four:\n- Exactly one word each.\n- No emojis, no punctuation, no markdown.\n\n2. Generate ONE Emotional Insight paragraph (90–160 characters):\n   - Calm, observational, emotionally aware.\n   - Should combine BOTH photo emotions and chip data.\n   - No instructions, no advice, no lists.\n   - No emojis or markdown.\n\nRETURN JSON ONLY in this structure:\n\n{\n  \"positive\": \"string\",\n  \"neutral\": \"string\",\n  \"stressed\": \"string\",\n  \"heavy\": \"string\",\n  \"insight\": \"string\"\n}',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '3',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.advancedMoodScan = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'The user mood is \"{CurrentMood}\". \n\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\n\nDo NOT use lists, markdown, bold, headings, or emojis.\n\nOne gentle sentence only.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '1',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(
            () => _model.generateGentleTextBasedOnMood = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'Create one Emotional Insight paragraph (90–160 characters):\n   - Calm, emotionally-aware, observational tone.\n   - No advice, no instructions.\n   - No emojis or markdown.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '4',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.emotionalInsight = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'You must output exactly ONE WORD based on the user\'s mood inputs.\n\nRULES:\n- Output ONLY one word.\n- No sentences.\n- No punctuation.\n- No emojis.\n- No spaces or hyphens.\n- Alphabetic letters only.\n- Capitalize the first letter.\n- If your output contains more than one word, regenerate until it is ONE word only.\n\nUSER MOOD INPUTS:\nMood: \"{mood}\"\nEnergy: \"{energy}\"\nFocus: \"{focus}\"\nTone: \"{tone}\"\n\nRESPONSE FORMAT:\nReturn ONLY the one word. Nothing else.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '5',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.positiveSingleWord = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'You must output exactly ONE WORD based on the user\'s mood inputs.\n\nRULES:\n- Output ONLY one word.\n- No sentences.\n- No punctuation.\n- No emojis.\n- No spaces or hyphens.\n- Alphabetic letters only.\n- Capitalize the first letter.\n- If your output contains more than one word, regenerate until it is ONE word only.\n\nUSER MOOD INPUTS:\nMood: \"{mood}\"\nEnergy: \"{energy}\"\nFocus: \"{focus}\"\nTone: \"{tone}\"\n\nRESPONSE FORMAT:\nReturn ONLY the one word. Nothing else.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '5',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.neutralSingleWord = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'You must output exactly ONE WORD based on the user\'s mood inputs.\n\nRULES:\n- Output ONLY one word.\n- No sentences.\n- No punctuation.\n- No emojis.\n- No spaces or hyphens.\n- Alphabetic letters only.\n- Capitalize the first letter.\n- If your output contains more than one word, regenerate until it is ONE word only.\n\nUSER MOOD INPUTS:\nMood: \"{mood}\"\nEnergy: \"{energy}\"\nFocus: \"{focus}\"\nTone: \"{tone}\"\n\nRESPONSE FORMAT:\nReturn ONLY the one word. Nothing else.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '5',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.stressedSingleWord = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'You must output exactly ONE WORD based on the user\'s mood inputs.\n\nRULES:\n- Output ONLY one word.\n- No sentences.\n- No punctuation.\n- No emojis.\n- No spaces or hyphens.\n- Alphabetic letters only.\n- Capitalize the first letter.\n- If your output contains more than one word, regenerate until it is ONE word only.\n\nUSER MOOD INPUTS:\nMood: \"{mood}\"\nEnergy: \"{energy}\"\nFocus: \"{focus}\"\nTone: \"{tone}\"\n\nRESPONSE FORMAT:\nReturn ONLY the one word. Nothing else.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '5',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.heavySingleWord = generatedText);
      });

      logFirebaseEvent('AdvancedMoodTracker_a_i_agent');
      await callAiAgent(
        context: context,
        prompt:
            'Analyze the users picture to generate a single text word that describes the mood analyzed in the photo.',
        imageUrl: valueOrDefault(currentUserDocument?.currentMoodPhoto, ''),
        threadId: '1',
        agentCloudFunctionName: 'advancedMoodAnalyzer',
        provider: 'GOOGLE',
        agentJson:
            '{\"status\":\"LIVE\",\"identifier\":{\"name\":\"advancedMoodAnalyzer\",\"key\":\"czkjr\"},\"name\":\"AdvancedMoodAnalyzer\",\"description\":\"This Self-Care agent is for primarily giving a one word response to \\\"What is the user\'s mood, according to their uploaded photo?\\\"\",\"aiModel\":{\"provider\":\"GOOGLE\",\"model\":\"gemini-2.5-pro\",\"parameters\":{\"temperature\":{\"inputValue\":1.55},\"maxTokens\":{\"inputValue\":32000},\"topP\":{\"inputValue\":0.5}},\"messages\":[{\"role\":\"SYSTEM\",\"text\":\"You are a Self-Care agent for the AI Self Care company Escape LLC and you are here to use the users mood in the firebase documents for this project \\\"{CurrentMood}\\\". \\r\\n\\nWrite a warm, emotionally-safe insight that fits in 140–220 characters.\\r\\nDo NOT use lists, markdown, bold, headings, or emojis.\\r\\n\\nOne gentle sentence only.\\r\\n\"},{\"role\":\"USER\",\"text\":\"What is an insight based on the current mood of the image or choice chips (list of strings) I uploaded to you?\"}]},\"requestOptions\":{\"requestTypes\":[\"PLAINTEXT\",\"IMAGE\"]},\"responseOptions\":{\"responseType\":\"PLAINTEXT\"}}',
        responseType: 'PLAINTEXT',
      ).then((generatedText) {
        safeSetState(() => _model.aIMoodAnalyzeAction = generatedText);
      });
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1620.0.ms,
            begin: Offset(8.0, 8.0),
            end: Offset(-98.0, -87.0),
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 280.0.ms,
            duration: 1140.0.ms,
            color: FlutterFlowTheme.of(context).secondary,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1620.0.ms,
            begin: Offset(8.0, 8.0),
            end: Offset(-34.0, -87.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1620.0.ms,
            duration: 600.0.ms,
            begin: 0.14,
            end: 0.935,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 230.0.ms,
            duration: 1660.0.ms,
            color: FlutterFlowTheme.of(context).accent1,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 80.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 80.0.ms,
            duration: 830.0.ms,
            begin: Offset(-1.0, -85.0),
            end: Offset(6.0, -3.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1270.0.ms,
            duration: 470.0.ms,
            begin: 0.265,
            end: 0.935,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 420.0.ms,
            duration: 1720.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1620.0.ms,
            begin: Offset(-1.0, -85.0),
            end: Offset(49.0, 5.0),
          ),
          FadeEffect(
            curve: Curves.easeIn,
            delay: 1620.0.ms,
            duration: 600.0.ms,
            begin: 0.14,
            end: 0.935,
          ),
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 510.0.ms,
            duration: 1410.0.ms,
            color: FlutterFlowTheme.of(context).primary,
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: 500.0,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                                PointerDeviceKind.stylus,
                                PointerDeviceKind.unknown,
                              },
                            ),
                            child: Scrollbar(
                              controller: _model.columnController1,
                              child: SingleChildScrollView(
                                controller: _model.columnController1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: ScrollConfiguration(
                                          behavior:
                                              ScrollConfiguration.of(context)
                                                  .copyWith(
                                            scrollbars: false,
                                            dragDevices: {
                                              PointerDeviceKind.mouse,
                                              PointerDeviceKind.touch,
                                              PointerDeviceKind.stylus,
                                              PointerDeviceKind.unknown,
                                            },
                                          ),
                                          child: Scrollbar(
                                            controller:
                                                _model.columnController2,
                                            child: SingleChildScrollView(
                                              controller:
                                                  _model.columnController2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.arrow_back,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      25.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4wqb6ol5' /* How are you feeling? */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '164mjxkt' /* Take a moment to check in with... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'u6hah92n' /* Positive */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8wmlz1oq' /* Happy */,
                                                                  ),
                                                                  FFIcons
                                                                      .kemojiSmileyHappyFace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'c5sy02xr' /* Excited */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .exclamation),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'sz3vhpqd' /* Peaceful */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .peace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'oo8ri9qe' /* Confident */,
                                                                  ),
                                                                  FFIcons
                                                                      .kinnerConflict),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'awuf3hz7' /* Loved */,
                                                                  ),
                                                                  Icons
                                                                      .favorite),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '56p0c7nx' /* Grateful */,
                                                                  ),
                                                                  Icons
                                                                      .celebration)
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValues1 =
                                                                        val),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              iconSize: 18.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xA7D0E3F7),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              iconSize: 16.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 50.0,
                                                            rowSpacing: 15.0,
                                                            multiselect: true,
                                                            initialized: _model
                                                                    .choiceChipsValues1 !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceAround,
                                                            controller: _model
                                                                    .choiceChipsValueController1 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'se3d7g9h' /* Neutral */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '1hvtb6l5' /* Okay */,
                                                                  ),
                                                                  FFIcons
                                                                      .kthumbUp),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'jg2tu554' /* Thoughtful */,
                                                                  ),
                                                                  FFIcons
                                                                      .kbrain),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ojswii9i' /* Tired */,
                                                                  ),
                                                                  FFIcons
                                                                      .ktired),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'slwjfk39' /* Content */,
                                                                  ),
                                                                  FFIcons
                                                                      .kcontact)
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValues2 =
                                                                        val),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              iconSize: 18.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xCDD0E3F7),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              iconSize: 16.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 50.0,
                                                            rowSpacing: 15.0,
                                                            multiselect: true,
                                                            initialized: _model
                                                                    .choiceChipsValues2 !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceAround,
                                                            controller: _model
                                                                    .choiceChipsValueController2 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'is03rv9m' /* Stressed */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'v7ifudfj' /* Anxious */,
                                                                  ),
                                                                  FFIcons
                                                                      .kemojiSmileyHappyFace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kvulv3bu' /* Frustrated */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .exclamation),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yi5jityd' /* Nervous */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .peace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'r9voz0us' /* Overwhelmed */,
                                                                  ),
                                                                  FFIcons
                                                                      .kinnerConflict)
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValues3 =
                                                                        val),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xDAE65454),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              iconSize: 18.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xCDD0E3F7),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              iconSize: 16.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 50.0,
                                                            rowSpacing: 15.0,
                                                            multiselect: true,
                                                            initialized: _model
                                                                    .choiceChipsValues3 !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceAround,
                                                            controller: _model
                                                                    .choiceChipsValueController3 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'onpb1cp1' /* Heavy */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child:
                                                              FlutterFlowChoiceChips(
                                                            options: [
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'zphmvnps' /* Sad */,
                                                                  ),
                                                                  FFIcons
                                                                      .kemojiSmileyHappyFace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'uyxfg574' /* Disappointed */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .exclamation),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6jawfpw8' /* Lonely */,
                                                                  ),
                                                                  FontAwesomeIcons
                                                                      .peace),
                                                              ChipData(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rpv3gokj' /* Worried */,
                                                                  ),
                                                                  FFIcons
                                                                      .kinnerConflict)
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.choiceChipsValues4 =
                                                                        val),
                                                            selectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              iconSize: 18.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            unselectedChipStyle:
                                                                ChipStyle(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xCDD0E3F7),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              iconSize: 16.0,
                                                              elevation: 8.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            chipSpacing: 50.0,
                                                            rowSpacing: 15.0,
                                                            multiselect: true,
                                                            initialized: _model
                                                                    .choiceChipsValues4 !=
                                                                null,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceAround,
                                                            controller: _model
                                                                    .choiceChipsValueController4 ??=
                                                                FormFieldController<
                                                                    List<
                                                                        String>>(
                                                              [],
                                                            ),
                                                            wrapped: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 20.0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'ADVANCED_MOOD_TRACKER_CONTINUE_BTN_ON_TA');
                                                        logFirebaseEvent(
                                                            'Button_update_app_state');
                                                        FFAppState()
                                                            .addToAdvancedMoodChoiceChips(_model
                                                                .choiceChipsValues1!
                                                                .firstOrNull!);
                                                        FFAppState()
                                                            .addToNeutralMoodsHistory(_model
                                                                .choiceChipsValues2!
                                                                .take(5)
                                                                .toList()
                                                                .firstOrNull!);
                                                        FFAppState()
                                                            .addToStressedMoodsHistory(_model
                                                                .choiceChipsValues3!
                                                                .take(5)
                                                                .toList()
                                                                .firstOrNull!);
                                                        FFAppState()
                                                            .addToHeavyMoodsHistory(_model
                                                                .choiceChipsValues4!
                                                                .take(5)
                                                                .toList()
                                                                .firstOrNull!);
                                                        FFAppState()
                                                            .update(() {});
                                                        logFirebaseEvent(
                                                            'Button_page_view');
                                                        await _model
                                                            .pageViewController
                                                            ?.nextPage(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'e2u9rvga' /* Continue */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 50.0,
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent1,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 0.0,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        't0o3arb7' /* Your mood helps us personalize... */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 24.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 16.0, 16.0, 16.0),
                                  child: ScrollConfiguration(
                                    behavior: ScrollConfiguration.of(context)
                                        .copyWith(
                                      scrollbars: false,
                                      dragDevices: {
                                        PointerDeviceKind.mouse,
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind.stylus,
                                        PointerDeviceKind.unknown,
                                      },
                                    ),
                                    child: Scrollbar(
                                      controller: _model.columnController3,
                                      child: SingleChildScrollView(
                                        controller: _model.columnController3,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.arrow_back,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Flexible(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'cald0dj6' /* Mood Insight */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'The Seasons',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 403.2,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            const CircleBorder(),
                                                        child: Container(
                                                          width: 103.7,
                                                          height: 103.7,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent1,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .sentiment_satisfied,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 20.0,
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .positiveSingleWord,
                                                                      'Grateful',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation1']!),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -0.3),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            const CircleBorder(),
                                                        child: Container(
                                                          width: 77.19,
                                                          height: 77.19,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF8DB4D3),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .sentiment_neutral,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 18.0,
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .neutralSingleWord,
                                                                      'Tired',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation2']!),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 200.0,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: Colors
                                                                .transparent,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Opacity(
                                                          opacity: 0.5,
                                                          child: Lottie.asset(
                                                            'assets/jsons/pulse.json',
                                                            width: 200.0,
                                                            height: 200.0,
                                                            fit: BoxFit.contain,
                                                            reverse: true,
                                                            animate: true,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.8, 0.8),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            const CircleBorder(),
                                                        child: Container(
                                                          width: 80.87,
                                                          height: 80.87,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF6B7CE8),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .sentiment_dissatisfied,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 18.0,
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .heavySingleWord,
                                                                      'Lonely',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation3']!),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.8, 0.8),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 2.0,
                                                        shape:
                                                            const CircleBorder(),
                                                        child: Container(
                                                          width: 102.46,
                                                          height: 102.46,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFF8A9B),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .sentiment_very_dissatisfied,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25.0,
                                                                ),
                                                                Flexible(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .stressedSingleWord,
                                                                      'Frustrated',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'containerOnPageLoadAnimation4']!),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'lr13k2bf' /* Tension Beneath Gratitude */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    duration: Duration(
                                                        milliseconds: 2295),
                                                    curve: Curves.easeIn,
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        _model.advancedMoodScan,
                                                        'You\'re carrying a heavy burden and seeking nature will help you best. ',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 1.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                16.0,
                                                                16.0,
                                                                16.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .warning,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .lightbulb_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'rmtx8cr6' /* Emotional Insight */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                              AnimatedDefaultTextStyle(
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        1965),
                                                                curve: Curves
                                                                    .easeIn,
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .emotionalInsight,
                                                                    'Your mood pattern shows complexity - gratitude coexisting with underlying stress. This is completely normal and shows emotional awareness.',
                                                                  ),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .fade,
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '78yvy8pv' /* What would help right now? */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'WorkSans',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent1,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons.air,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '66si2mf0' /* Breathwork */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1k6ocadx' /* 5-minute guided breathing */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '33qb4con' /* 5 min */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'WorkSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .edit_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ebdm2eot' /* Journal */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6pglfik2' /* Write about your feelings */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'mylqp1h8' /* 10 min */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'WorkSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 40.0,
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .person_outline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'm0jid12r' /* Talk to Lucille */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6nqcl3xp' /* I'm here to listen and support */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'WorkSans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '8thop36n' /* Now */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'WorkSans',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 12.0)),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'ADVANCED_MOOD_TRACKER_SAVE_INSIGHTS_BTN_');
                                                  logFirebaseEvent(
                                                      'Button_page_view');
                                                  await _model
                                                      .pageViewController
                                                      ?.nextPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                text:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'x69tapbx' /* Save insights */,
                                                ),
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  padding: EdgeInsets.all(8.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent3,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'WorkSans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 2.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 24.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                                PointerDeviceKind.stylus,
                                PointerDeviceKind.unknown,
                              },
                            ),
                            child: Scrollbar(
                              controller: _model.columnController4,
                              child: SingleChildScrollView(
                                primary: false,
                                controller: _model.columnController4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 16.0, 16.0, 25.0),
                                      child: ScrollConfiguration(
                                        behavior:
                                            ScrollConfiguration.of(context)
                                                .copyWith(
                                          scrollbars: false,
                                          dragDevices: {
                                            PointerDeviceKind.mouse,
                                            PointerDeviceKind.touch,
                                            PointerDeviceKind.stylus,
                                            PointerDeviceKind.unknown,
                                          },
                                        ),
                                        child: Scrollbar(
                                          controller: _model.columnController5,
                                          child: SingleChildScrollView(
                                            controller:
                                                _model.columnController5,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      FlutterFlowIconButton(
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.arrow_back,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'ADVANCED_MOOD_TRACKER_arrow_back_ICN_ON_');
                                                          logFirebaseEvent(
                                                              'IconButton_navigate_back');
                                                          context.pop();
                                                        },
                                                      ),
                                                      FlutterFlowIconButton(
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_control,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 32.0,
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uqsm9x7w' /* Session Complete */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'yllwyblo' /* 2:34 PM */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      GradientText(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ttiascgz' /* Beautiful work today! */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                        colors: [
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1
                                                        ],
                                                        gradientDirection:
                                                            GradientDirection
                                                                .ltr,
                                                        gradientType:
                                                            GradientType.linear,
                                                      ),
                                                      Text(
                                                        valueOrDefault<String>(
                                                          _model
                                                              .generateGentleTextBasedOnMood,
                                                          'You\'ve taken meaningful steps toward understanding your emotional landscape. I\'m proud of your commitment to self-care.',
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons.trending_up,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '4e9m331n' /* Your Emotional Check-in */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'WorkSans',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'lzvt8u8t' /* Mood */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                                GradientText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    _model
                                                                        .aIMoodAnalyzeAction,
                                                                    'Happy',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  colors: [
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate
                                                                  ],
                                                                  gradientDirection:
                                                                      GradientDirection
                                                                          .ltr,
                                                                  gradientType:
                                                                      GradientType
                                                                          .linear,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '5hnn01rx' /* Energy */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                                AnimatedDefaultTextStyle(
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          600),
                                                                  curve: Curves
                                                                      .easeIn,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .aIMoodAnalyzeAction,
                                                                      'Lethargic',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          12.0,
                                                                      height:
                                                                          12.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '2e703137' /* Focus */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'WorkSans',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          8.0)),
                                                                ),
                                                                AnimatedDefaultTextStyle(
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          600),
                                                                  curve: Curves
                                                                      .easeIn,
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .aIMoodAnalyzeAction,
                                                                      'Meditation',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 12.0)),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 12.0,
                                                            height: 12.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent1,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'w19xxnws' /* Today's Journey */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.favorite,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'm12n27rd' /* Gratitude reflection completed */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.air,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 16.0,
                                                              ),
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'obbew6vn' /* 5-minute breathing exercise */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'WorkSans',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 12.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent3,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.format_quote,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'xerrchsu' /* Progress, not perfection, is t... */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'zn4oo8tn' /* — Your mindful companion */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'zpr16t7k' /* What would help right now? */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'WorkSans',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADVANCED_MOOD_TRACKER_Row_sgqa3gq9_ON_TA');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                BasicBreathingGoalPageWidget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons.air,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '5ajrtuem' /* Basic Breathing */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '9ve0i7dn' /* 5-minute guided breathing */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'wzs5oe95' /* 5 min */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .tertiary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADVANCED_MOOD_TRACKER_Row_yklj767s_ON_TA');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                JournalPageVersion5Widget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'r1g88o9a' /* Journal */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'idojpnxj' /* Write about your feelings */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '3a7x8ip5' /* 10 min */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'ADVANCED_MOOD_TRACKER_Row_q72oej80_ON_TA');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                ChatWithLucilleVersion5Widget
                                                                    .routeName,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  kTransitionInfoKey:
                                                                      TransitionInfo(
                                                                    hasTransition:
                                                                        true,
                                                                    transitionType:
                                                                        PageTransitionType
                                                                            .rightToLeft,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            1),
                                                                  ),
                                                                },
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          24.0,
                                                                      height:
                                                                          24.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.asset(
                                                                            'assets/images/a3fd262b556877da7280b850d5b2fa52.gif',
                                                                          ).image,
                                                                        ),
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'owkuqosc' /* Talk to Lucille */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'v1b14wgv' /* I'm here to listen and support */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'WorkSans',
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kmfvqs7v' /* Now */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'WorkSans',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 16.0)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'ADVANCED_MOOD_TRACKER_CONTINUE_YOUR_JOUR');
                                                      logFirebaseEvent(
                                                          'Button_page_view');
                                                      await _model
                                                          .pageViewController
                                                          ?.nextPage(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.ease,
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '5xu9y53e' /* Continue Your Journey */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 0.0, 16.0,
                                                          25.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'ADVANCED_MOOD_TRACKER_Text_cxaz76fe_ON_T');
                                                      logFirebaseEvent(
                                                          'Text_haptic_feedback');
                                                      HapticFeedback
                                                          .lightImpact();
                                                      logFirebaseEvent(
                                                          'Text_navigate_to');

                                                      context.pushNamed(
                                                        HomeVersion5Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    9),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'gbo3grkk' /* Maybe later */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'WorkSans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 24.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              scrollbars: false,
                              dragDevices: {
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.touch,
                                PointerDeviceKind.stylus,
                                PointerDeviceKind.unknown,
                              },
                            ),
                            child: Scrollbar(
                              controller: _model.columnController6,
                              child: SingleChildScrollView(
                                primary: false,
                                controller: _model.columnController6,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 200.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 892.39,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xB3EDF1F7),
                                                FlutterFlowTheme.of(context)
                                                    .secondary
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, -0.34),
                                              end: AlignmentDirectional(
                                                  -1.0, 0.34),
                                            ),
                                          ),
                                          child: wrapWithModel(
                                            model: _model
                                                .moodWeatherVersion5CompModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                MoodWeatherVersion5CompWidget(),
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
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 60.0, 0.0, 0.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 4,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              safeSetState(() {});
                            },
                            effect: smooth_page_indicator.SlideEffect(
                              spacing: 8.0,
                              radius: 16.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor: FlutterFlowTheme.of(context).secondary,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).accent1,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
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
