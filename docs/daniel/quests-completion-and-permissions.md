# Quests completion and permissions update

Hi team,

I finished the main Quest updates and added a testing option for the team.

The Quest page now saves joined challenges and keeps the user's daily progress after restarting the app. Users can check in once per day, complete the challenge after seven days, receive XP once, and continue to the Rewards page after completing the challenge.

I also added the Quest reminder permission step. The permission request is working, but the actual scheduled notification still needs the notification service to be connected.

For testing, debug builds now include a Quest reset option. Press and hold the Active Challenge card, confirm the reset, and the Quest progress will return to its starting point. This only resets Quest testing data and does not change the user's total XP. This option is not available in the App Store version.

I also checked the permissions used by the app. Camera, Photo Library, Microphone, Speech Recognition, Location, and notification permission requests are present. Some permission flows still need improvements before the Apple submission, especially Location being requested when Settings opens, Microphone being requested as soon as the voice-chat page opens, denied-permission handling, and the notification settings switch.

Push notifications are not fully connected yet. The app can ask for permission, but the Apple Push Notification capability, notification registration, delivery service, and Quest reminder scheduling still need to be completed.

No text colors or layouts were changed as part of this work.
