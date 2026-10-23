# Soundscapes launch: 120 new tracks — composer brief

Catalog: `escape_api/data/soundscape_catalog.json` (LucilleLLM). **120 new tracks** across **11 categories** (was 39 tracks across 9), weighted toward vaporwave and nature. Two new categories: `dreamdrift` (Vaporwave & Dreamdrift) and `nature_elements` (Nature Elements).

## Read this first: the references are directional only

Every "inspired by" below names **real, commercially released music** purely to fix a direction in words that a sentence cannot: a texture, a tempo feel, an instrument, how patient the piece is. They are a brief, not source material.

- **Delivered audio must be original and fully cleared.** No melody, bassline, chord progression, drum pattern or arrangement copied or closely paraphrased from a reference.
- **No stems, no samples, no interpolations, no re-sings, no "in the style of" covers.** Not from the reference recording, not from a multitrack, not from an acapella, not from a YouTube rip. This includes the vaporwave set, where the genre's own convention of chopping existing records is **not** available to us: the slowed-tape sound has to be produced from material we own.
- **Do not use these references — or any Epidemic Sound track — as ML reference or training audio.** Epidemic Sound's licence prohibits using their catalog to train or condition generative models, including as a style/reference input, so no Epidemic Sound (or other library) audio may be fed to any audio model, and nor may the commercial references above.
- Titles here are ours and must not borrow a reference's title. Nothing in the delivered metadata, artwork or copy may name an artist or track from this document.
- Every delivery needs a signed originality + clearance declaration naming the composer and confirming all instruments, samples and model inputs are owned or licensed for this use, before it goes near the bucket.

## Production spec

| | |
|---|---|
| Codec / container | AAC-LC, `.m4a`, 48 kHz, stereo, 160 kbps |
| Segments | `intro.m4a` + `body_1..4.m4a` + `outro.m4a` + `preview.m4a` |
| Segment lengths | intro 45 s, each body 150 s, outro 60 s, preview 30 s |
| Same key and tempo | across all six segments of a track, so bodies are interchangeable |
| `durationSec` | the catalog's 20/30/45/60-minute figure is the **session** length, reached by the player looping and reordering the four bodies — not the length of the delivered files (45 + 4×150 + 60 s) |
| Path | `soundscapes/{category}/{trackId}/` — exactly as in the catalog's `audio.path` |
| Loudness | **-16 LUFS integrated** for the deliverables, true peak ≤ -1 dBTP |
| Player loudness | the app offsets per mode (focus -16, calm -18, sleep -20, move -14); deliver at -16 and let the player attenuate |
| Loop points | every body must loop seamlessly into itself **and** into any other body of the same track: zero-crossing edges, no reverb tail cut, no DC offset |
| Crossfade | the player crossfades 4 s between segments — keep the first and last 4 s free of new events and of anything that reads as an edit |
| No abrupt cuts | nothing starts or stops inside a segment; intros fade in from silence, outros resolve to silence over the final 15 s |
| Sleep material | nothing above 6 kHz loud enough to notice, no event in the final third, clean low end on a pillow speaker |
| 8D / binaural | only the four 8D tracks and the Binaural Beats category; these must be mixed and checked on headphones and must not collapse to mono artefacts |
| Preview | a representative 30 s from a body, fading in and out, never the intro |

`moodField` (energy/texture, both 0-1) places the track on the Mood Orb grid and is what `POST /v1/soundscapes/pick` matches against, so the audio has to actually sit where the number says: low energy = slow and still, high texture = wet and diffuse. `targetWords` come from the Escape mood vocabulary (`escape_api/data/mood_words.json`) and drive mood-word matching.

### Honesty about brainwave and frequency material

`brainwave` and `frequencyHz` are set only where the audio genuinely contains that pulse or tone: the Binaural Beats and Brainwave Music categories, the named-frequency drones, and a handful of sleep and meditation pieces whose pulse really is at the stated rate. The number must be measurable in the delivered file. Nothing anywhere in the product claims a medical or therapeutic effect — copy stays descriptive ("a 6 Hz theta pulse"), never prescriptive ("induces deep sleep", "heals", "treats anxiety"). Solfeggio-style numbers (396/528/639 Hz and friends) are presented as tunings people ask for, not as medicine. The Depression & Anxiety category carries its own disclaimer and is free for everyone.

## Summary

| Category | New | Total | New by mode | Premium (new) |
|---|---:|---:|---|---:|
| `music_meditations` | 8 | 12 | calm 5, sleep 3 | 3 |
| `vaporwave` | 18 | 22 | focus 6, calm 6, sleep 2, move 4 | 7 |
| `jazz` | 9 | 13 | focus 3, calm 4, move 2 | 4 |
| `nature` | 18 | 23 | calm 6, sleep 5, focus 4, move 3 | 6 |
| `binaural_beats` | 8 | 12 | focus 2, calm 3, sleep 3 | 3 |
| `brainwave_music` | 8 | 12 | focus 2, calm 2, sleep 2, move 2 | 3 |
| `raw_frequencies` | 6 | 12 | calm 2, sleep 2, focus 2 | 2 |
| `sleep_ambient` | 7 | 11 | sleep 5, calm 2 | 2 |
| `depression_anxiety` | 6 | 10 | calm 5, sleep 1 | 0 |
| `dreamdrift` | 16 | 16 | focus 4, calm 6, sleep 3, move 3 | 6 |
| `nature_elements` | 16 | 16 | calm 5, sleep 4, focus 4, move 3 | 7 |
| **total** | **120** | **159** | calm 46, sleep 30, focus 27, move 17 | **43** |

Premium split: **43/120 (36%)**. Nothing new in `depression_anxiety` is premium.

## The tracks

### Music Meditations — `music_meditations`

Slow, melodic pieces to breathe and settle with. Modes: calm, sleep. Colour `#B9A3F0`.

**What to borrow.** Borrow the **restraint**: one idea per piece, long decays, no arrival. Felt piano, bowls, bowed strings, breath-length phrases (8-12 s). Nothing that resolves — the listener should be able to stop paying attention without noticing a gap.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `music_meditations_05` | Singing Bowl Sunrise | calm | 66 | 30:00 | no | Deuter – 'Sun Spirit'; Peter Kater & Snatam Kaur – 'Heart of the Universe' |
| `music_meditations_06` | Open Palm | calm | 60 | 30:00 | no | Max Richter – 'Dream 3 (in the midst of my life)'; Harold Budd – 'Not Yet Remembered' |
| `music_meditations_07` | Small Returns | calm | 64 | 45:00 | yes | Ólafur Arnalds – 'Near Light'; Nils Frahm – 'Says' (opening two minutes only) |
| `music_meditations_08` | Thirty Slow Breaths | calm | 58 | 20:00 | no | Brian Eno – 'An Ending (Ascent)'; Hammock – 'Mono No Aware' |
| `music_meditations_09` | Candle Watch | sleep | 52 | 45:00 | no | Stars of the Lid – 'Articulate Silences Part 1'; Deuter – 'Nada Himalaya' <br/>_theta 6 Hz_ |
| `music_meditations_10` | Body Scan Dusk | sleep | 48 | 45:00 | yes | Hiroshi Yoshimura – 'Blink'; Midori Takada – 'Mr. Henri Rousseau's Dream' |
| `music_meditations_11` | Hands on Heart | calm | 62 | 30:00 | no | Joep Beving – 'Ab Ovo'; Dustin O'Halloran – 'Opus 23' |
| `music_meditations_12` | Lantern Descent | sleep | 46 | 60:00 | yes | Jónsi & Alex – 'Daniell in the Sea'; Biosphere – 'Kobresia' <br/>_theta 5 Hz_ |

### Vaporwave — `vaporwave`

Hazy, nostalgic synth textures for easy focus and late nights. Modes: focus, calm, sleep, move. Colour `#E99C64`.

**What to borrow.** Borrow the **medium, not the melody**: tape wobble, chorused Rhodes and DX7 bells, gated-plate reverb, slight pitch drift, the 2 kHz dullness of a VHS dub. Keep the harmony simple and ours. Mall/plaza tracks want a wide room and a slow, half-asleep kick; the Move tracks want a dry, forward 16th-note bassline.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `vaporwave_05` | Chrome Palm Court | focus | 82 | 30:00 | no | Macintosh Plus – 'リサフランク420'; Vektroid – 'Angel' |
| `vaporwave_06` | Dial Tone Summer | focus | 86 | 30:00 | no | Saint Pepsi – 'Private Caller'; Blank Banshee – 'Teen Pregnancy' |
| `vaporwave_07` | Duty Free Daydream | calm | 70 | 30:00 | no | Luxury Elite – 'Hair Salon'; 猫 シ Corp. – 'Palm Mall' (food-court section) |
| `vaporwave_08` | Escalator Sunset | calm | 66 | 30:00 | yes | Hiroshi Yoshimura – 'Creek'; 猫 シ Corp. – 'Shopping Channel' |
| `vaporwave_09` | Fountain Court Loop | focus | 80 | 30:00 | no | Cat System Corp. – 'Virtual Mall'; Luxury Elite – 'World Class' |
| `vaporwave_10` | Laserdisc Weather | focus | 92 | 30:00 | yes | Chuck Person – 'Eccojams Vol. 1, A1'; Oneohtrix Point Never – 'Nassau' |
| `vaporwave_11` | Peach Static | calm | 68 | 30:00 | no | Washed Out – 'Feel It All Around'; Memory Tapes – 'Bicycle' |
| `vaporwave_12` | VHS Tape Rewind | calm | 62 | 45:00 | no | Boards of Canada – 'Dayvan Cowboy'; The Caretaker – 'An Empty Bliss Beyond This World' |
| `vaporwave_13` | Elevator to the Pool Deck | focus | 88 | 30:00 | yes | Yung Bae – 'Bae City Rollers'; Night Tempo – 'Tokyo Lights' |
| `vaporwave_14` | Soft Serve Horizon | calm | 72 | 30:00 | yes | Toro y Moi – 'Still Sound'; George Clanton – 'Livin' Loose' |
| `vaporwave_15` | Slow Burn Boulevard | focus | 84 | 30:00 | no | Com Truise – 'Brokendate'; Tycho – 'A Walk' |
| `vaporwave_16` | After Hours Atrium | sleep | 56 | 60:00 | yes | Hiroshi Yoshimura – 'Water Copy'; 猫 シ Corp. – 'Hotel Lobby' |
| `vaporwave_17` | Blue Carpet Showroom | sleep | 50 | 60:00 | no | Desired – 'Lavender'; Stars of the Lid – 'Dungtitled (in A major)' |
| `vaporwave_18` | Plaza Rain Delay | calm | 65 | 30:00 | no | Nujabes – 'Aruarian Dance'; Teen Daze – 'Hidden Worlds' |
| `vaporwave_19` | Future Funk Commute | move | 112 | 15:00 | no | Yung Bae – 'Bad Boy'; Night Tempo – 'Ladies in the City' |
| `vaporwave_20` | Rollerink Revival | move | 120 | 15:00 | yes | Saint Pepsi – 'Enjoy Yourself'; Chromeo – 'Jealous (I Ain't With It)' |
| `vaporwave_21` | Cassette Cardio | move | 108 | 20:00 | no | Tatsuro Yamashita – 'Bomber'; Anri – 'Last Summer Whisper' |
| `vaporwave_22` | Holiday Inn Infinity | move | 104 | 20:00 | yes | Mariya Takeuchi – 'Plastic Love'; Macross 82-99 – 'Selfish High Heels' |

### Jazz — `jazz`

Soft lo-fi and late-night jazz that sits in the background. Modes: focus, calm, move. Colour `#EF7702`.

**What to borrow.** Borrow the **ensemble behaviour**: brushes on a dampened kit, upright bass with finger noise left in, one voice at a time, room mics rather than close mics. No solos that demand attention and no walk-ups into choruses — the listener is working or falling asleep.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `jazz_05` | Dim Lamp Ballad | calm | 62 | 30:00 | no | Bill Evans – 'Peace Piece'; Duke Ellington – 'In a Sentimental Mood' |
| `jazz_06` | Second Cup | focus | 86 | 30:00 | no | Vince Guaraldi Trio – 'Skating'; Ahmad Jamal – 'Poinciana' |
| `jazz_07` | Brush and Bass | focus | 80 | 30:00 | no | Oscar Peterson Trio – 'You Look Good to Me'; Ron Carter – 'Blues for D. P.' |
| `jazz_08` | Snow on the Fire Escape | calm | 66 | 30:00 | yes | Chet Baker – 'Alone Together'; Bill Evans – 'Blue in Green' |
| `jazz_09` | Last Train Quartet | calm | 64 | 45:00 | yes | John Coltrane – 'Naima'; Jimmy Giuffre 3 – 'The Train and the River' |
| `jazz_10` | Attic Piano Hours | focus | 74 | 30:00 | no | Keith Jarrett – 'The Köln Concert, Part II c'; Brad Mehldau – 'When It Rains' |
| `jazz_11` | Smoke and Velvet | calm | 70 | 30:00 | yes | Stan Getz & João Gilberto – 'Corcovado'; Ben Webster – 'My Romance' |
| `jazz_12` | Uptown Shuffle | move | 108 | 20:00 | no | Horace Silver – 'Song for My Father'; Jimmy Smith – 'Back at the Chicken Shack' |
| `jazz_13` | Big Band Elevator | move | 118 | 15:00 | yes | Count Basie – 'Corner Pocket'; Benny Goodman – 'Sing, Sing, Sing' (tempo and swing only, a fraction of the volume) |

### Nature — `nature`

Rain, ocean, forest and fire beds, gently mixed. Modes: calm, sleep, focus, move. Colour `#39D9C1`.

**What to borrow.** Borrow the **patience and the spectrum**, never the recording. Each bed is one place, held long enough that the ear stops cataloguing it; events (a bird, a far engine) at most every 40-60 s and never startling. Most of these have no tempo at all. The three Move tracks add a light pulse under the bed, not on top of it.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `nature_06` | Thunder Over Fields | calm | — | 30:00 | no | Chris Watson – 'Weather Report'; Irv Teibel – 'Environments 4: Thunderstorm' |
| `nature_07` | Rain on a Tin Roof | calm | — | 60:00 | no | Chris Watson – 'Weather Report'; Hiroshi Yoshimura – 'Wet Land' |
| `nature_08` | Night Crickets | sleep | — | 60:00 | no | Bernie Krause – 'The Great Animal Orchestra' (night chorus); Francisco López – 'La Selva' |
| `nature_09` | Snow Hush | sleep | — | 60:00 | yes | Chris Watson – 'Vatnajökull'; Jana Winderen – 'Spring Bloom in the Marginal Ice Zone' |
| `nature_10` | River Bend | focus | — | 30:00 | no | Annea Lockwood – 'A Sound Map of the Hudson River'; Chris Watson – 'Stepping into the Dark' |
| `nature_11` | Pine Wind | focus | — | 30:00 | no | Hildegard Westerkamp – 'Beneath the Forest Floor'; Chris Watson – 'Outside the Circle of Fire' |
| `nature_12` | Tide Pools | calm | — | 30:00 | no | Irv Teibel – 'Environments 1: Psychologically Ultimate Seashore'; Jana Winderen – 'Out of Range' |
| `nature_13` | Dawn Chorus | focus | — | 30:00 | yes | Bernie Krause – 'The Great Animal Orchestra' (dawn chorus); Hildegard Westerkamp – 'Kits Beach Soundwalk' |
| `nature_14` | Desert Night Air | sleep | — | 60:00 | no | Chris Watson – 'El Tren Fantasma'; Steve Roach – 'Desert Solitaire' |
| `nature_15` | Waterfall Distance | focus | — | 30:00 | yes | Annea Lockwood – 'A Sound Map of the Danube'; Hiroshi Yoshimura – 'Creek' |
| `nature_16` | Marsh at Sundown | calm | — | 45:00 | no | Bernie Krause – wetland recordings; Francisco López – 'La Selva' |
| `nature_17` | Driftwood Fire | sleep | — | 60:00 | yes | Chris Watson – 'Hrafn: Conversations with Odin'; Brian Eno – 'Lux 1' (the sparse musical glue only) |
| `nature_18` | Alpine Meadow Noon | calm | — | 30:00 | no | Hildegard Westerkamp – 'Talking Rain'; Bernie Krause – 'Nature's Symphony' (meadow) |
| `nature_19` | Storm Passing Through | calm | — | 45:00 | yes | Chris Watson – 'Ol-Olool-O'; Irv Teibel – 'Environments 4: Thunderstorm' |
| `nature_20` | Creek Under Ice | sleep | — | 60:00 | no | Jana Winderen – 'Energy Field'; Annea Lockwood – 'A Sound Map of the Hudson River' |
| `nature_21` | Trail Run Sunrise | move | 116 | 20:00 | no | Bonobo – 'Kerala' (pulse only); Four Tet – 'Angel Echoes' |
| `nature_22` | Coastline Cadence | move | 108 | 20:00 | yes | Bonobo – 'Cirrus'; Nicolas Jaar – 'Mi Mujer' |
| `nature_23` | Canopy Climb | move | 104 | 20:00 | no | Four Tet – 'Two Thousand and Seventeen'; Caribou – 'Sun' |

### Binaural Beats — `binaural_beats`

Stereo beat layers (headphones on) for focus, calm or sleep. Modes: focus, calm, sleep. Colour `#4CF6F6`. Disclaimer: _Use headphones. Not for use while driving._

**What to borrow.** The beat is generated, not referenced: two sine carriers whose difference equals the stated Hz, under a neutral pad. Reference material is only for the **carrier bed's** character. Keep the carriers below 250 Hz and the beat at least 12 dB under the pad, and never let the pad mask the difference tone.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `binaural_beats_05` | Beta Sprint 18 Hz | focus | 98 | 30:00 | no | Steve Roach – 'Quiet Music 1'; Robert Rich – 'Trances' <br/>_beta 18 Hz, headphones_ |
| `binaural_beats_06` | Beta Steady 14 Hz | focus | 90 | 30:00 | no | Brian Eno – 'Discreet Music'; Robert Rich – 'Drones' <br/>_beta 14 Hz, headphones_ |
| `binaural_beats_07` | Alpha Open 8 Hz | calm | 68 | 30:00 | no | Steve Roach – 'Structures from Silence'; Harold Budd & Brian Eno – 'The Pearl' <br/>_alpha 8 Hz, headphones_ |
| `binaural_beats_08` | Alpha Wash 11 Hz | calm | 72 | 30:00 | yes | Hiroshi Yoshimura – 'Green'; Brian Eno – 'Thursday Afternoon' <br/>_alpha 11 Hz, headphones_ |
| `binaural_beats_09` | Theta Low Tide 4.5 Hz | calm | 58 | 45:00 | no | Robert Rich – 'Somnium'; Éliane Radigue – 'Adnos I' <br/>_theta 4.5 Hz, headphones_ |
| `binaural_beats_10` | Theta Lantern 7 Hz | sleep | 54 | 45:00 | yes | Steve Roach – 'Immersion: One'; Stars of the Lid – 'Don't Bother, They're Here' <br/>_theta 7 Hz, headphones_ |
| `binaural_beats_11` | Delta Floor 1 Hz | sleep | 42 | 60:00 | no | William Basinski – 'dlp 1.2'; Thomas Köner – 'Permafrost' <br/>_delta 1 Hz, headphones_ |
| `binaural_beats_12` | Delta Night Shift 3 Hz | sleep | 46 | 60:00 | yes | Éliane Radigue – 'Trilogie de la Mort'; Biosphere – 'Substrata' <br/>_delta 3 Hz, headphones_ |

### Brainwave Music — `brainwave_music`

Music tuned around delta, theta, alpha and beta pulses. Modes: focus, calm, sleep, move. Colour `#8E7CD9`. Disclaimer: _Not for use while driving._

**What to borrow.** Borrow the **steady, non-rhythmic pulse**: amplitude or filter movement at the stated rate inside real music, so it works on a phone speaker (unlike the binaural set). Minimalist repetition is the model, not trance.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `brainwave_music_05` | Clear Desk Beta | focus | 94 | 30:00 | no | Steve Reich – 'Electric Counterpoint: Fast'; Philip Glass – 'Opening' (Glassworks) <br/>_beta 15 Hz_ |
| `brainwave_music_06` | Task Light | focus | 88 | 30:00 | no | Nils Frahm – 'Hammers'; Steve Reich – 'Music for 18 Musicians' <br/>_beta 13 Hz_ |
| `brainwave_music_07` | Alpha Meadow | calm | 70 | 30:00 | no | Hiroshi Yoshimura – 'Green'; Harold Budd – 'Bismillahi 'Rrahmani 'Rrahim' <br/>_alpha 10 Hz_ |
| `brainwave_music_08` | Soft Alpha Rain | calm | 64 | 30:00 | yes | Brian Eno – 'Music for Airports 2/1'; Gigi Masin – 'Clouds' <br/>_alpha 8 Hz_ |
| `brainwave_music_09` | Theta Hallway | sleep | 50 | 45:00 | no | Stars of the Lid – 'Austin Texas Mental Hospital'; Robert Rich – 'Somnium' <br/>_theta 6 Hz_ |
| `brainwave_music_10` | Delta Floorboards | sleep | 44 | 60:00 | yes | William Basinski – 'dlp 1.1'; Thomas Köner – 'Nuuk' <br/>_delta 2 Hz_ |
| `brainwave_music_11` | Beta Drive | move | 112 | 20:00 | no | Jon Hopkins – 'Open Eye Signal'; Rival Consoles – 'Phantom Grip' <br/>_beta 18 Hz_ |
| `brainwave_music_12` | Pulse Ladder | move | 122 | 15:00 | yes | Steve Reich – 'Electric Counterpoint'; Jon Hopkins – 'Emerald Rush' <br/>_beta 20 Hz_ |

### Raw Frequencies — `raw_frequencies`

Pure tones and drones at named frequencies, nothing else. Modes: calm, sleep, focus. Colour `#D0E3F7`.

**What to borrow.** Not music. A pure tone or a two-partial drone at the named frequency, dead steady, with only enough slow movement (±2 cents, a breathing filter) to stop it sounding synthetic. References are for drone **character** and how long a single pitch can be held before it fatigues.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `raw_frequencies_07` | 285 Hz Drone | calm | — | 30:00 | no | Éliane Radigue – 'Adnos II'; Pauline Oliveros – 'Deep Listening' (drone sustain) <br/>_285 Hz tone_ |
| `raw_frequencies_08` | 417 Hz Drone | calm | — | 30:00 | no | La Monte Young – 'The Well-Tuned Piano' (sustain); Pauline Oliveros – 'Lear' <br/>_417 Hz tone_ |
| `raw_frequencies_09` | 741 Hz Drone | focus | — | 30:00 | yes | Catherine Christer Hennix – 'The Electric Harpsichord'; La Monte Young – 'Drift Study' <br/>_741 Hz tone_ |
| `raw_frequencies_10` | 963 Hz Drone | focus | — | 30:00 | yes | Alvin Lucier – 'Still and Moving Lines of Silence in Families of Hyperbolas'; Éliane Radigue – 'Kyema' <br/>_963 Hz tone_ |
| `raw_frequencies_11` | 65 Hz Low Drone | sleep | — | 60:00 | no | Thomas Köner – 'Permafrost'; Deathprod – 'Treetop Drive' <br/>_65 Hz tone_ |
| `raw_frequencies_12` | 111 Hz Drone | sleep | — | 60:00 | no | Alvin Lucier – 'Music on a Long Thin Wire'; Éliane Radigue – 'Adnos I' <br/>_111 Hz tone_ |

### Sleep / Ambient Music — `sleep_ambient`

Long, low, slowly evolving ambience for winding down and sleep. Modes: sleep, calm. Colour `#39519F`.

**What to borrow.** Borrow the **slowness of change**: a chord that takes two minutes to turn into the next one, no event in the last third, nothing above 6 kHz loud enough to notice. Low-end has to be clean on a pillow speaker.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `sleep_ambient_05` | Long Hallway Light | sleep | 46 | 60:00 | no | Stars of the Lid – 'Hiberner Toujours'; A Winged Victory for the Sullen – 'Steep Hills of Vicodin Tears' |
| `sleep_ambient_06` | Snow Field Hum | sleep | 42 | 60:00 | no | Thomas Köner – 'Nunatak Gongamur'; Biosphere – 'Substrata' |
| `sleep_ambient_07` | Harbor Lights Dimming | sleep | 50 | 60:00 | yes | Gigi Masin – 'Clouds'; Brian Eno – 'Lux 1' |
| `sleep_ambient_08` | Low Room Tone | sleep | 40 | 60:00 | no | William Basinski – 'Melancholia I'; Éliane Radigue – 'Adnos III' |
| `sleep_ambient_09` | Last Lamp On | calm | 58 | 45:00 | no | Harold Budd & Brian Eno – 'Against the Sky'; Grouper – 'Living Room' |
| `sleep_ambient_10` | Weightless Floor | sleep | 44 | 60:00 | yes | Marconi Union – 'Weightless'; Max Richter – 'Sleep: Dream 1' |
| `sleep_ambient_11` | Before Morning | calm | 62 | 45:00 | no | Ólafur Arnalds – 'Saman'; Nils Frahm – 'Ambre' |

### Music for Depression & Anxiety — `depression_anxiety`

Gentle, steady music for heavy or anxious moments. A support, not a treatment. Modes: calm, sleep. Colour `#A1A6CC`. Disclaimer: _Music can support how you feel, but it isn't a treatment. If you're struggling, Lucille can share support resources any time._

**What to borrow.** Borrow **warmth and predictability**. Regular, slow, major-leaning, no surprises, no swell that could read as dread. Avoid the cinematic build these references are famous for — take the first 90 seconds of them and stay there. Nothing in this category is premium and nothing in it makes a claim.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `depression_anxiety_05` | Small Steady Light | calm | 60 | 30:00 | no | Max Richter – 'On the Nature of Daylight' (the restraint, not the build); Joep Beving – 'Sleeping Lotus' |
| `depression_anxiety_06` | Hold Here | calm | 56 | 30:00 | no | Marconi Union – 'Weightless Part 2'; Brian Eno – 'Music for Airports 1/1' |
| `depression_anxiety_07` | Weight Off | calm | 66 | 30:00 | no | Ólafur Arnalds – 'Near Light'; Hania Rani – 'Glass' |
| `depression_anxiety_08` | One Breath More | calm | 62 | 20:00 | no | Nils Frahm – 'Me'; Dustin O'Halloran – 'Opus 37' |
| `depression_anxiety_09` | Quiet Company | sleep | 50 | 45:00 | no | Grouper – 'Alien Observer'; Harold Budd – 'The Room Alone' |
| `depression_anxiety_10` | Morning Is Allowed | calm | 70 | 30:00 | no | Hania Rani – 'Esja'; Ólafur Arnalds – 'Særir' |

### Vaporwave & Dreamdrift — `dreamdrift` **(new category)**

Slowed, tape-warm dream pop and drifting synth for late focus and long nights. Modes: focus, calm, sleep, move. Colour `#0B1230`. Disclaimer: _A few tracks use headphone-only 8D panning; they're marked on the player._

**What to borrow.** Borrow the **blur**: guitars and pads so wet they read as one instrument, bass as a soft floor, no transient edges. This is vaporwave's slower, sadder cousin — less mall, more empty hotel. Two tracks are 8D: author those as a real slow rotation in a decorrelated stereo field, not a widener plug-in.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `dreamdrift_01` | Glass Elevator Dawn | focus | 78 | 30:00 | no | Tycho – 'Awake'; Boards of Canada – 'Olson' |
| `dreamdrift_02` | Lilac Static Field | calm | 68 | 30:00 | no | Grouper – 'Heavy Water / I'd Rather Be Sleeping'; Slowdive – 'Sugar for the Pill' |
| `dreamdrift_03` | Hotel Pool at Midnight | calm | 62 | 45:00 | yes | Julianna Barwick – 'The Harbinger'; Hiroshi Yoshimura – 'Clouds' |
| `dreamdrift_04` | Slowwave Boulevard | focus | 84 | 30:00 | no | Cocteau Twins – 'Cherry-Coloured Funk'; Com Truise – 'Colorvision' |
| `dreamdrift_05` | Cloud Terminal | focus | 80 | 30:00 | yes | Brian Eno – 'Music for Airports 1/1'; Jon Hopkins – 'Abandon Window' |
| `dreamdrift_06` | Memory Foam Sky | sleep | 52 | 60:00 | no | Stars of the Lid – 'Even (If) You're Never Awake'; A Winged Victory for the Sullen – 'Requiem for the Static King Part One' |
| `dreamdrift_07` | Tape Hiss Lullaby | sleep | 46 | 60:00 | no | William Basinski – 'dlp 1.1'; The Caretaker – 'Libet's Delay' |
| `dreamdrift_08` | Softfocus Skyline | calm | 70 | 30:00 | no | Helios – 'Halving the Compass'; Ulrich Schnauss – 'On My Own' |
| `dreamdrift_09` | Orbit of Small Lights | calm | 64 | 45:00 | yes | Max Richter – 'On the Nature of Daylight'; Jóhann Jóhannsson – 'Odi et Amo' |
| `dreamdrift_10` | Eight Directions | calm | 66 | 30:00 | yes | Brian Eno & Daniel Lanois – 'Deep Blue Day'; Alva Noto & Ryuichi Sakamoto – 'Logos' (8D rotation, headphones) <br/>_headphones_ |
| `dreamdrift_11` | Carousel of Blue Rooms | sleep | 48 | 60:00 | yes | William Basinski – 'Melancholia II'; Steve Roach – 'Structures from Silence' (8D rotation, headphones) <br/>_headphones_ |
| `dreamdrift_12` | Chrome Rain Window | focus | 76 | 30:00 | no | Nujabes – 'Feather'; Bibio – 'Lovers' Carvings' |
| `dreamdrift_13` | Parallax Drive | move | 106 | 20:00 | no | Kavinsky – 'Nightcall'; Com Truise – 'Forgive' |
| `dreamdrift_14` | Neon Tide Runner | move | 118 | 15:00 | yes | The Midnight – 'Sunset'; Gunship – 'Tech Noir' |
| `dreamdrift_15` | Afterglow Shuttle | move | 102 | 20:00 | no | Tycho – 'Dive'; Lindstrøm – 'Baby Can't Stop' |
| `dreamdrift_16` | Long Way Home Lights | calm | 60 | 45:00 | no | Beach House – 'Space Song'; Mazzy Star – 'Fade Into You' |

### Nature Elements — `nature_elements` **(new category)**

Water, wind, fire, stone and ice beds — single elements, held for a long time. Modes: calm, sleep, focus, move. Colour `#E6EAF4`.

**What to borrow.** Borrow the **single-element discipline**: one material (water, wind, fire, stone, ice) and nothing else. These should feel closer and drier than the Nature beds — more contact microphone than wide stereo pair. Two are 8D and need a genuine rotating field.

| id | title | mode | bpm | dur | premium | inspired by (directional only) |
|---|---|---|---:|---:|:-:|---|
| `nature_elements_01` | Deep Water Hum | calm | — | 45:00 | no | Jana Winderen – 'Out of Range'; Biosphere – 'Hyperborea' |
| `nature_elements_02` | Wind Through Dry Grass | calm | — | 30:00 | no | Chris Watson – 'Ol-Olool-O'; Toshiya Tsunoda – 'Extract from Field Recording Archive' |
| `nature_elements_03` | Ember Bed | sleep | — | 60:00 | no | Chris Watson – 'Hrafn: Conversations with Odin' (fire); Brian Eno – 'Thursday Afternoon' |
| `nature_elements_04` | Stone and Moss | calm | — | 30:00 | no | Hildegard Westerkamp – 'Beneath the Forest Floor'; Éliane Radigue – 'Kyema' |
| `nature_elements_05` | Glacier Breath | sleep | — | 60:00 | yes | Jana Winderen – 'Spring Bloom in the Marginal Ice Zone'; Biosphere – 'Cho Oyu 8201m' |
| `nature_elements_06` | Salt Flat Silence | sleep | — | 60:00 | no | Éliane Radigue – 'Trilogie de la Mort'; Steve Roach – 'Structures from Silence' |
| `nature_elements_07` | Monsoon Window | calm | — | 45:00 | yes | Chris Watson – 'Weather Report'; Hiroshi Yoshimura – 'Wet Land' |
| `nature_elements_08` | Underwater Garden | calm | — | 30:00 | yes | Jana Winderen – 'The Listener'; Hiroshi Yoshimura – 'Water Copy' (8D rotation, headphones) <br/>_headphones_ |
| `nature_elements_09` | Cave Drip Chorus | sleep | — | 60:00 | yes | Chris Watson – 'Vatnajökull' (sub-glacial); Francisco López – 'La Selva' |
| `nature_elements_10` | Geyser Field Morning | focus | — | 30:00 | no | Chris Watson – 'Stepping into the Dark'; Annea Lockwood – 'Thousand Year Dreaming' |
| `nature_elements_11` | Aspen Shiver | focus | — | 30:00 | no | Hildegard Westerkamp – 'Talking Rain'; Toshiya Tsunoda – 'O Kokos no Ha' |
| `nature_elements_12` | Sandstorm Far Off | focus | — | 30:00 | yes | Biosphere – 'Cho Oyu 8201m'; Thomas Köner – 'Nunatak Gongamur' |
| `nature_elements_13` | Tidewalk | move | 104 | 20:00 | no | Bonobo – 'Cirrus'; Jon Hopkins – 'Open Eye Signal' (pulse only) |
| `nature_elements_14` | Summit Wind Sprint | move | 122 | 15:00 | yes | Jon Hopkins – 'Emerald Rush'; Rival Consoles – 'Recovery' |
| `nature_elements_15` | Rivermouth Run | move | 112 | 20:00 | no | Bonobo – 'Kong'; Four Tet – 'Baby' |
| `nature_elements_16` | Thermal Updraft | focus | — | 30:00 | yes | Alva Noto & Ryuichi Sakamoto – 'Logos'; Thomas Köner – 'Permafrost' (8D rotation, headphones) <br/>_headphones_ |

## Still to produce

- **Audio: 120 × 7 files = 840 `.m4a` deliverables** (intro + 4 bodies + outro + preview), at the paths in the catalog. Nothing is rendered yet.
  `python -m render_service.catalog --only <trackId>` renders a placeholder set from the catalog's style map, which now covers the two new categories; the launch versions are the composer's.
- **Artwork:** a card image per track (120) and a category tile + icon for the two new categories. `dreamdrift` needs an icon named `vhs`, `nature_elements` one named `droplet`; neither exists in the icon set yet. Palette colours are `#0B1230` (night) and `#E6EAF4` (mist).
- **Mood Orb loops:** the Move mode now has tracks for the first time (17 of them). `core.soundscape_loop` currently folds `move` into the `picks` loop grid — either publish an `escape_move_e*_t*_v3` set of loops or accept the `picks` visuals for launch.
- **Copy review** of the 120 titles, plus the two new category labels and descriptions, in app and store copy.
- **Clearance pack:** signed originality + clearance declaration per delivery, and confirmation in writing that no Epidemic Sound or other library audio was used as model reference or training input.

## What changed in code

| File | Change |
|---|---|
| `escape_api/data/soundscape_catalog.json` | +120 tracks, +2 categories; `move` added to `vaporwave`, `jazz`, `nature`, `brainwave_music`; `sleep` added to `vaporwave`; `focus` added to `raw_frequencies` (`raw_frequencies_06` was already `mode: focus` while the category did not declare it) |
| `escape_api/routers/soundscapes.py` | `CategoryId` literal extended with the two new ids |
| `escape_api/journal.py` | the reflection prompt's category list extended |
| `render_service/catalog.py` | `STYLE` entries for the new categories, and the title-keyword ambience bed map extended and applied to `nature_elements` as well as `nature` |
| `tests/v1/test_v1_api.py` | expects 11 categories, asserts every declared category × mode pair has ≥ 2 playable tracks, and that `pick(mode=move)` returns a Move track in range |
