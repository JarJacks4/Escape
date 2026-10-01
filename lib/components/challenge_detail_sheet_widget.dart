import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/permissions_util.dart';
import '/flutter_flow/quest_reminder_service.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/rewards_splash_page/rewards_splash_page_widget.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'challenge_detail_sheet_model.dart';
export 'challenge_detail_sheet_model.dart';

class ChallengeDetailSheetWidget extends StatefulWidget {
  const ChallengeDetailSheetWidget({
    super.key,
    required this.challengeId,
    required this.title,
    required this.subtitle,
    this.totalDays = 7,
    this.xp = 500,
  });

  final String challengeId;
  final String title;
  final String subtitle;
  final int totalDays;
  final int xp;

  @override
  State<ChallengeDetailSheetWidget> createState() =>
      _ChallengeDetailSheetWidgetState();
}

class _ChallengeDetailSheetWidgetState
    extends State<ChallengeDetailSheetWidget> {
  late ChallengeDetailSheetModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChallengeDetailSheetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Future<void> _completeTodayCheckIn() async {
    final appState = FFAppState();
    if (functions.checkedInToday(appState.questCheckIns)) return;

    logFirebaseEvent(
      'QUEST_DAILY_CHECK_IN',
      parameters: {'challenge': widget.challengeId},
    );
    appState.update(() => appState.addToQuestCheckIns(DateTime.now()));

    await _requestQuestReminderPermission(appState);

    if (!mounted) return;
    final completedDays = functions.challengeStreak(appState.questCheckIns);
    var completedNow = false;
    if (completedDays >= widget.totalDays &&
        !appState.completedChallenges.contains(widget.challengeId)) {
      completedNow = true;
      appState.update(
        () {
          appState.pointsEarned += widget.xp;
          appState.addToCompletedChallenges(widget.challengeId);
        },
      );
    }
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text('Day $completedDays of ${widget.totalDays} done'),
          duration: Duration(milliseconds: 2500),
        ),
      );

    if (completedNow) {
      await QuestReminderService.cancelDailyReminder();
      appState.update(() => appState.questRemindersEnabled = false);
      final rootContext = appNavigatorKey.currentContext;
      Navigator.of(context).pop();
      rootContext?.pushNamed(RewardsSplashPageWidget.routeName);
    }
  }

  Future<void> _requestQuestReminderPermission(FFAppState appState) async {
    if (appState.askedQuestReminders) return;
    appState.update(() => appState.askedQuestReminders = true);

    final wantsReminder = await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text('Want a morning reminder?'),
            content: Text(
              'We\'ll nudge you at 9 AM so your streak doesn\'t slip.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: Text('Not now'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: Text('Remind me'),
              ),
            ],
          ),
        ) ??
        false;
    if (!wantsReminder) return;

    final isAllowed = await requestNotificationPermissionWithSettings(context);
    final reminderScheduled =
        isAllowed && await QuestReminderService.scheduleDailyReminder();
    appState.update(
      () {
        appState.questRemindersEnabled = reminderScheduled;
        if (!reminderScheduled) appState.askedQuestReminders = false;
      },
    );
    if (currentUserReference != null) {
      await currentUserReference!.update(
        createUsersRecordData(notificationsAllowed: reminderScheduled),
      );
    }
    if (isAllowed && !reminderScheduled && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('The 9 AM Quest reminder could not be scheduled.'),
          duration: Duration(milliseconds: 4000),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final checkIns = FFAppState().questCheckIns;
    final completedDays = functions.challengeStreak(checkIns);
    final progress =
        functions.challengeProgress(completedDays, widget.totalDays);
    final daysLeft =
        functions.challengeDaysLeft(completedDays, widget.totalDays);
    final days = functions.challengeDays(checkIns, widget.totalDays);
    final isCheckedInToday = functions.checkedInToday(checkIns);

    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.9,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCC96A), Color(0xFFFBD38D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 120.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56.0,
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent1,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.center,
                    child: FaIcon(
                      FontAwesomeIcons.trophy,
                      color: Colors.white,
                      size: 26.0,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                fontFamily: 'WorkSans',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0,
                              ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          widget.subtitle,
                          style: FlutterFlowTheme.of(context)
                              .bodySmall
                              .override(
                                fontFamily: 'WorkSans',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF22C55E),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          FFAppState()
                                  .completedChallenges
                                  .contains(widget.challengeId)
                              ? 'Completed'
                              : 'Active',
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'WorkSans',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 22.0,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overall Progress',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    functions.challengePercentLabel(progress),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              LinearPercentIndicator(
                percent: progress,
                lineHeight: 10.0,
                padding: EdgeInsets.zero,
                progressColor: FlutterFlowTheme.of(context).accent1,
                backgroundColor: Colors.white,
                barRadius: Radius.circular(12.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ChallengeStat(value: '$completedDays', label: 'Days Done'),
                  _ChallengeStat(value: '$daysLeft', label: 'Days Left'),
                  _ChallengeStat(value: '${widget.xp}', label: 'XP Reward'),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Daily Progress',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'WorkSans',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              ...days.map((day) {
                final status = functions.challengeDayStatus(day, checkIns);
                final isCompleted = status == 'Completed';
                return Container(
                  margin: EdgeInsets.only(top: 8.0),
                  padding: EdgeInsets.all(14.0),
                  decoration: BoxDecoration(
                    color: isCompleted ? Color(0xFFFDEBEA) : Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                    children: [
                      if (isCompleted) ...[
                        Icon(
                          Icons.check_circle,
                          color: Color(0xFF22C55E),
                          size: 22.0,
                        ),
                        SizedBox(width: 12.0),
                      ],
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('EEEE').format(day),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              DateFormat('MMM d').format(day),
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'WorkSans',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        status,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily: 'WorkSans',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ],
                  ),
                );
              }),
              FFButtonWidget(
                onPressed: isCheckedInToday ? null : _completeTodayCheckIn,
                text: isCheckedInToday
                    ? 'Checked in today ✓'
                    : 'Complete Today\'s Check-In',
                icon: Icon(Icons.trending_up, size: 20.0),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 56.0,
                  color: FlutterFlowTheme.of(context).accent1,
                  disabledColor: FlutterFlowTheme.of(context).secondaryText,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'WorkSans',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}

class _ChallengeStat extends StatelessWidget {
  const _ChallengeStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                fontFamily: 'Cormorant SC',
                color: FlutterFlowTheme.of(context).primaryText,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.0,
              ),
        ),
        Text(
          label,
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'WorkSans',
                color: FlutterFlowTheme.of(context).secondaryText,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
