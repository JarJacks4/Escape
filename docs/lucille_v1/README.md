# Lucille v1 wiring (Journal V2, Mood, Soundscapes AI, Self-Care, Privacy)

FlutterFlow regenerates this repo, so the source of truth for these files is the **FlutterFlow editor**.
Paste each file into FlutterFlow (Custom Code) or push it with the FlutterFlow VS Code extension:

| File | FlutterFlow item | Settings |
|---|---|---|
| `lib/custom_code/actions/lucille_v1.dart` | Custom Action `lucilleV1` | args: method (String), path (String), body (JSON, nullable) · returns JSON |
| `lib/custom_code/widgets/mood_orb_video.dart` | Custom Widget `MoodOrbVideo` | params: videoUrl (String), posterUrl, glowHex, heroTag (String, nullable) |
| `lib/custom_code/widgets/escape_journal_v2.dart` | Custom Widget `EscapeJournalV2` | params: initialScreen, initialMode (String, nullable), onClose (Action, nullable) |

Then:
1. New page **JournalHomeV2** (route `/journalHomeV2`), page params `screen`, `mode` (String). Body: `EscapeJournalV2`, width/height = infinity, `onClose` = Navigate Back.
2. Point the journal doors (Home, Mind, Reset, Lucille tab, Mood Result "Save this moment", side menu) at JournalHomeV2.
3. API Calls > + Add > Import OpenAPI: `docs/lucille_v1/escape_v1_openapi.json` (group "Lucille v1"). Add header
   `Authorization: Bearer [token]` with variable `token` = `currentJwtToken`, and `X-Timezone`.
4. Add the same Authorization header to the existing **TheoryOfMindLucille** groups so the API can turn on
   `LEGACY_REQUIRE_AUTH` later.

Full step-by-step for each intern: see the "Lucille v1 — Monday launch guide" page.

## Project check (escape-self-care-505618)

Everything runs in **escape-self-care-505618** (project number 861854898360): Firebase sign-in, Firestore and the
`lucille` Cloud Run service. All 12 API groups in this app already use `https://lucille-861854898360.us-central1.run.app`.

Fix in FlutterFlow (the repo copy is patched on this branch, but FlutterFlow regenerates it):
* **that_audio_player library › API Calls › LucilleSoundscapesGroup**: base URL was the dead
  `https://lucillellm2-286076426888.us-east4.run.app/` (old project). Change it to
  `https://lucille-861854898360.us-central1.run.app/`, then update the library version in the app.

Not changed (plan a migration): about 430 image/audio URLs in the app still load from the **old** project's bucket
`escape-self-care-ai.firebasestorage.app`. They work only while that project and bucket stay alive. Copy the files to
`escape-self-care-505618.firebasestorage.app` (or `escape-self-care-505618-escape-media`) and re-point them in
FlutterFlow before shutting the old project down.
