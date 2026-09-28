# Quests update

I worked on the Quests page and finished the first part of the functionality.

## What I changed

### Join Challenge buttons

The five **Join Challenge** buttons were only printing a message before. I updated them so users can now:

- Join a challenge.
- Leave a challenge by tapping the same button again.
- See the button change to **Joined ✓**.
- See a confirmation message after joining or leaving.

Joined challenges are stored locally on the device, so they are still selected after closing and reopening the app.

### Active Challenge progress

The Active Challenge card was showing fixed values like 71%, 5 days completed, and 2 days left.

I replaced those values with calculations based on the user's saved Quest check-ins. A new user now correctly sees:

- 0% progress.
- 0 days completed.
- 7 days left.
- 500 XP reward.

The progress calculation uses consecutive days. If a user misses a day, the current streak resets, but previous check-in dates remain saved.

### Challenge details

The Active Challenge card and trophy button now open a Challenge Details sheet.

The sheet currently shows:

- Challenge title and description.
- Current progress percentage.
- Days completed.
- Days remaining.
- XP reward.
- Seven daily progress rows.
- The status for each day: Today, Upcoming, Missed, or Completed.

The sheet is scrollable on smaller devices and can be closed using the X, by dragging it down, or by tapping outside it.

## Testing completed

I tested the changes on a physical iPhone.

I confirmed that:

- All five Join Challenge buttons can join and leave.
- Joined challenges remain selected after reopening the app.
- The Active Challenge card shows the correct zero state.
- Tapping the card opens the details sheet.
- Tapping the trophy opens the same sheet.
- The sheet scrolls without overflow or clipped content.
- The app builds successfully for iOS.

## Commits

- `26efe93` — Persist challenge membership.
- `a8f0ef8` — Add Active Challenge progress and details.

## Next step

The next step is adding the **Complete Today's Check-In** action. This will let the user complete one check-in per day and update the card and details sheet immediately.

Rewards, push notifications, and cross-device syncing are not included yet.
