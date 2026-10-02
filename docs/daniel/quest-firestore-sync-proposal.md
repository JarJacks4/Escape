# Quest Firestore sync proposal

Hi team,

I recommend keeping the Quest state on the existing `Users/{uid}` document. It is tied to one user, and this avoids adding another collection only for the current Quest flow.

The fields I suggest adding in FlutterFlow are:

- `active_quest_id` — String
- `joined_quest_ids` — List of Strings
- `quest_check_ins` — List of DateTimes
- `completed_quest_ids` — List of Strings
- `quest_reminders_enabled` — Boolean
- `quest_reminder_time` — DateTime
- `quest_updated_time` — DateTime

The app should continue saving Quest progress locally so it still works offline. When the user is signed in, it should also update the user's Firestore document. On a new device, the app should load the Firestore state first. If Firestore has no Quest data yet, the existing local state can be uploaded once.

`quest_updated_time` can be used to keep the newest state when local and Firestore data are different. Quest completion and XP should still be protected from being awarded more than once.

Jared will need to add these fields and deploy the matching rules through FlutterFlow before the sync is enabled. The rules should only allow an authenticated user to read and update Quest fields on their own user document. The `created_time` field should not be changed during a Quest update.

For scheduled push notifications, the backend will need the active Quest, reminder status and next reminder time. We should keep the current local reminder until the Apple/Firebase push setup, backend scheduling and Firestore rules are all working together.

I have not added Firestore writes yet. The final field names and data path should be confirmed in FlutterFlow first so the generated schema and rules stay in sync with the repository.
