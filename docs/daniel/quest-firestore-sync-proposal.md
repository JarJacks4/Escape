# Quest Firestore sync proposal

Hi team,

Jared confirmed that Quest data can use a subcollection. I recommend keeping the current Quest state in one document at `Users/{uid}/Quests/state`. This keeps Quest writes separate from the generated user document and gives the backend one predictable document to read for reminders.

The `state` document contains:

- `activeChallengeId` — String
- `joinedChallenges` — List of Strings
- `checkIns` — List of Timestamps
- `completedChallenges` — List of Strings
- `askedQuestReminders` — Boolean
- `questRemindersEnabled` — Boolean
- `updatedAt` — Timestamp

The app should continue saving Quest progress locally so it still works offline. When the user is signed in, it should also update the user's Firestore document. On a new device, the app should load the Firestore state first. If Firestore has no Quest data yet, the existing local state can be uploaded once.

`updatedAt` is used to keep the newest state when local and Firestore data are different. Quest completion and XP remain protected from being awarded more than once.

Jared will need to add the `Quests` subcollection and deploy the matching rules through FlutterFlow. The rules should only allow an authenticated user to read and write documents inside their own `Users/{uid}/Quests` path.

For scheduled push notifications, the backend will need the active Quest, reminder status and next reminder time. We should keep the current local reminder until the Apple/Firebase push setup, backend scheduling and Firestore rules are all working together.

The app keeps saving Quest progress locally first. Firestore mobile persistence queues changes made while offline and sends them when the connection returns. When the user signs in on another device, the app compares `updatedAt` and restores the newest Quest state.
