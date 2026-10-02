import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '/app_state.dart';

class QuestSyncService {
  QuestSyncService._();

  static final QuestSyncService instance = QuestSyncService._();

  StreamSubscription<User?>? _authSubscription;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _stateSubscription;
  FFAppState? _appState;
  String? _activeUid;

  void start(FFAppState appState) {
    _appState = appState;
    _authSubscription ??=
        FirebaseAuth.instance.authStateChanges().listen(_handleUserChanged);
  }

  Future<void> _handleUserChanged(User? user) async {
    await _stateSubscription?.cancel();
    _stateSubscription = null;
    _activeUid = user?.uid;
    if (user == null || _appState == null) return;

    _stateSubscription = _stateDocument(user.uid).snapshots().listen(
      (snapshot) => _reconcile(snapshot, user.uid),
      onError: (Object error) {
        debugPrint('Could not listen for Quest sync updates: $error');
      },
    );
  }

  void saveLocalState() {
    final appState = _appState;
    final user = FirebaseAuth.instance.currentUser;
    if (appState == null || user == null || user.uid != _activeUid) return;

    final now = DateTime.now().toUtc();
    appState.questOwnerUid = user.uid;
    appState.questUpdatedAt = now;
    _queueWrite(user.uid, now);
  }

  void _reconcile(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    String uid,
  ) {
    final appState = _appState;
    if (appState == null || uid != _activeUid) return;

    if (!snapshot.exists) {
      if (appState.questOwnerUid.isNotEmpty &&
          appState.questOwnerUid != uid) {
        final now = DateTime.now().toUtc();
        appState.update(
          () => appState.replaceQuestState(
            ownerUid: uid,
            activeChallengeId: 'emotion_mastery_7',
            joinedChallenges: const [],
            checkIns: const [],
            completedChallenges: const [],
            askedQuestReminders: false,
            questRemindersEnabled: false,
            updatedAt: now,
          ),
        );
        _queueWrite(uid, now);
        return;
      }

      final localUpdatedAt = appState.questUpdatedAt ?? DateTime.now().toUtc();
      appState.questOwnerUid = uid;
      appState.questUpdatedAt = localUpdatedAt;
      _queueWrite(uid, localUpdatedAt);
      return;
    }

    final data = snapshot.data()!;
    final remoteUpdatedAt = _readDate(data['updatedAt']);
    final belongsToAnotherUser = appState.questOwnerUid.isNotEmpty &&
        appState.questOwnerUid != uid;
    if (remoteUpdatedAt == null) {
      final now = appState.questUpdatedAt ?? DateTime.now().toUtc();
      if (belongsToAnotherUser) {
        appState.update(
          () => appState.replaceQuestState(
            ownerUid: uid,
            activeChallengeId: 'emotion_mastery_7',
            joinedChallenges: const [],
            checkIns: const [],
            completedChallenges: const [],
            askedQuestReminders: false,
            questRemindersEnabled: false,
            updatedAt: now,
          ),
        );
      } else {
        appState.questOwnerUid = uid;
        appState.questUpdatedAt = now;
      }
      _queueWrite(uid, now);
      return;
    }

    final localUpdatedAt = appState.questUpdatedAt;
    final remoteIsNewer = localUpdatedAt == null ||
        remoteUpdatedAt.isAfter(localUpdatedAt.toUtc());

    if (belongsToAnotherUser || remoteIsNewer) {
      appState.update(() {
        appState.replaceQuestState(
          ownerUid: uid,
          activeChallengeId:
              _readString(data['activeChallengeId']) ?? 'emotion_mastery_7',
          joinedChallenges: _readStrings(data['joinedChallenges']),
          checkIns: _readDates(data['checkIns']),
          completedChallenges: _readStrings(data['completedChallenges']),
          askedQuestReminders: data['askedQuestReminders'] == true,
          questRemindersEnabled: data['questRemindersEnabled'] == true,
          updatedAt: remoteUpdatedAt,
        );
      });
      return;
    }

    if (localUpdatedAt.isAfter(remoteUpdatedAt) &&
        !snapshot.metadata.hasPendingWrites) {
      _queueWrite(uid, localUpdatedAt.toUtc());
    }
  }

  void _queueWrite(String uid, DateTime updatedAt) {
    final appState = _appState;
    if (appState == null || uid != _activeUid) return;

    unawaited(
      _stateDocument(uid)
          .set(
            {
              'activeChallengeId': appState.activeChallengeId,
              'joinedChallenges': appState.joinedChallenges,
              'checkIns': appState.questCheckIns
                  .map((date) => Timestamp.fromDate(date.toUtc()))
                  .toList(),
              'completedChallenges': appState.completedChallenges,
              'askedQuestReminders': appState.askedQuestReminders,
              'questRemindersEnabled': appState.questRemindersEnabled,
              'updatedAt': Timestamp.fromDate(updatedAt.toUtc()),
            },
            SetOptions(merge: true),
          )
          .catchError((Object error) {
            debugPrint('Could not queue Quest state for sync: $error');
          }),
    );
  }

  DocumentReference<Map<String, dynamic>> _stateDocument(String uid) =>
      FirebaseFirestore.instance
          .collection('Users')
          .doc(uid)
          .collection('Quests')
          .doc('state');

  DateTime? _readDate(Object? value) {
    if (value is Timestamp) return value.toDate().toUtc();
    if (value is DateTime) return value.toUtc();
    if (value is String) return DateTime.tryParse(value)?.toUtc();
    return null;
  }

  List<DateTime> _readDates(Object? value) => value is Iterable
      ? value.map(_readDate).whereType<DateTime>().toList()
      : <DateTime>[];

  List<String> _readStrings(Object? value) => value is Iterable
      ? value.whereType<String>().toSet().toList()
      : <String>[];

  String? _readString(Object? value) => value is String ? value : null;
}
