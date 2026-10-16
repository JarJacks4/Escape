import SwiftUI

// Per-phase chrome for the scan flow. The orb and backgrounds are drawn by ScanFlowView;
// these are the frosted panels and controls that float over it.

// MARK: Mood 1 · Start

@available(iOS 17.0, *)
struct MoodStartChrome: View {
    var coins: Int
    var start: () -> Void
    var skip: () -> Void
    var close: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                GlassIconButton(systemName: "xmark", label: "Close", action: close)
                Spacer()
                CoinBadge(coins: coins, delta: nil)
            }
            VStack(spacing: 10) {
                Eyebrow(text: "Mood Scan")
                Text("How's your inner weather?")
                    .font(EscFont.display(32)).foregroundStyle(Esc.mist)
                    .multilineTextAlignment(.center).lineLimit(2)
            }
            .padding(.top, 24)
            Spacer()
            VStack(spacing: 10) {
                Text("About 45 seconds. Breathe with the orb while Lucille reads your pulse, then tell her how you feel.")
                    .font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                    .multilineTextAlignment(.center).padding(.bottom, 4)
                HStack(spacing: 8) {
                    ForEach(["Pulse · camera", "How you feel · tap", "A few words · voice"], id: \.self) {
                        Text($0).font(EscFont.ui(12)).foregroundStyle(Esc.mist).glassPill()
                    }
                }
                PrimaryCTA(title: "Start Mood Scan", action: start).padding(.top, 14)
                Button(action: skip) {
                    Text("Skip the camera, just tap how I feel").font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                        .frame(maxWidth: .infinity).frame(height: 44)
                }.buttonStyle(.plain)
                Text("Camera video stays on your phone. Last scan 2 h ago: Restless.")
                    .font(EscFont.ui(11)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 24).padding(.top, 56).padding(.bottom, 32)
    }
}

// MARK: Mood 2a · Pulse

@available(iOS 17.0, *)
struct MoodPulseChrome: View {
    var bpm: Int
    var secondsLeft: Int
    var back: () -> Void
    var skip: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            HStack { GlassIconButton(systemName: "chevron.left", label: "Back", action: back); Spacer() }
            VStack(spacing: 8) {
                Text("Breathe with the orb").font(EscFont.display(26)).foregroundStyle(Esc.mist)
                Text("In as it grows, out as it settles. Hold the phone still.")
                    .font(EscFont.ui(14)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
            }.padding(.top, 10)
            Spacer()
            VStack(spacing: 14) {
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Image(systemName: "heart.fill").foregroundStyle(Esc.ember).font(.system(size: 18))
                    Text("\(bpm)").font(EscFont.display(44)).foregroundStyle(Esc.mist)
                    Text("bpm").font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                }
                HStack(spacing: 8) {
                    ForEach(["Face in frame", "Good light", "\(secondsLeft) s"], id: \.self) {
                        Text($0).font(EscFont.ui(12)).foregroundStyle(Esc.mist).glassPill()
                    }
                }
                Button(action: skip) { Text("Skip pulse").font(EscFont.ui(14, .medium)).foregroundStyle(Esc.haze)
                    .padding(.horizontal, 18).frame(height: 44).glass(22) }
                    .buttonStyle(.plain).padding(.top, 8)
            }.padding(.bottom, 40)
        }
        .padding(.horizontal, 24).padding(.top, 56).padding(.bottom, 32)
    }
}

// MARK: Mood 2b · Feel

@available(iOS 17.0, *)
struct MoodFeelChrome: View {
    @Binding var reading: MoodReading
    var next: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("How does it feel right now?").font(EscFont.display(26)).foregroundStyle(Esc.mist)
                    .multilineTextAlignment(.center)
                Text("Move the orb. It changes with you.").font(EscFont.ui(14)).foregroundStyle(Esc.haze)
            }.padding(.top, 10)
            Spacer()
            VStack(spacing: 12) {
                labelledSlider("Energy", value: $reading.energy)
                labelledSlider("Pleasant", value: $reading.valence)
                HStack(spacing: 8) {
                    ForEach(reading.words, id: \.self) { w in
                        Button { reading.chosenWord = w } label: {
                            Text(w).font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                                .padding(.horizontal, 16).frame(height: 40)
                                .background(w == reading.word ? AnyShapeStyle(Esc.royal.opacity(0.7)) : AnyShapeStyle(.ultraThinMaterial),
                                            in: Capsule())
                                .overlay(Capsule().strokeBorder(w == reading.word ? Esc.lilac : .white.opacity(0.12), lineWidth: 1))
                        }.buttonStyle(.plain)
                    }
                }.padding(.top, 2)
                PrimaryCTA(title: "That's it", action: next).padding(.top, 6)
            }
        }
        .padding(.horizontal, 24).padding(.top, 120).padding(.bottom, 32)
    }
    private func labelledSlider(_ title: String, value: Binding<Double>) -> some View {
        HStack(spacing: 10) {
            Text(title).font(EscFont.ui(13)).foregroundStyle(Esc.haze).frame(width: 84, alignment: .leading)
            Slider(value: value, in: 0...1).tint(Esc.lilac)
        }
        .padding(.horizontal, 14).padding(.vertical, 6).glass(18)
    }
}

// MARK: Mood 2c · Words

@available(iOS 17.0, *)
struct MoodWordsChrome: View {
    @Binding var words: String
    var next: () -> Void
    private let suggestions = ["Too many tabs open", "Big day tomorrow", "Slept badly"]
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("Anything on your mind?").font(EscFont.display(26)).foregroundStyle(Esc.mist)
                Text("Say or type a few words for Lucille. Optional.").font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                    .multilineTextAlignment(.center)
            }.padding(.top, 10)
            Spacer()
            VStack(spacing: 12) {
                HStack(spacing: 10) {
                    TextField("Too many tabs open in my head", text: $words)
                        .font(EscFont.ui(15)).foregroundStyle(Esc.mist)
                        .padding(.horizontal, 16).frame(height: 52).glass(16)
                    GlassIconButton(systemName: "mic.fill", label: "Hold to talk to Lucille", size: 52) {}
                }
                HStack(spacing: 8) {
                    ForEach(suggestions, id: \.self) { s in
                        Button { words = s } label: {
                            Text(s).font(EscFont.ui(13)).foregroundStyle(Esc.haze).glassPill()
                        }.buttonStyle(.plain)
                    }
                }
                PrimaryCTA(title: "See my mood", action: next).padding(.top, 6)
            }
        }
        .padding(.horizontal, 24).padding(.top, 120).padding(.bottom, 32)
    }
}

// MARK: Mood 3 · Result (with Lucille's suggestions)

@available(iOS 17.0, *)
struct MoodResultChrome: View {
    var reading: MoodReading
    var coins: Int
    var level: CoinLevel
    var words: String
    @Binding var saveHealth: Bool
    var host: ScanHost
    var close: () -> Void
    var unlock: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                GlassIconButton(systemName: "xmark", label: "Close", action: close)
                Spacer()
                CoinBadge(coins: coins, delta: "+25")
            }
            .padding(.horizontal, 24).padding(.top, 56)
            ScrollView {
                VStack(spacing: 12) {
                    VStack(spacing: 6) {
                        Eyebrow(text: "Lucille hears", color: Esc.haze)
                        Text(reading.word).font(EscFont.display(40)).foregroundStyle(Esc.mist)
                        Text(reading.line).font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                    }.padding(.top, 8)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("What Lucille noticed").font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.mist)
                        HStack {
                            stat("\(reading.bpm)", "bpm pulse"); stat("\(Int(reading.energy*100))%", "energy"); stat("\(Int(reading.valence*100))%", "pleasant")
                        }
                        Text(reading.because).font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(16).glass(20)

                    // Lucille suggests
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lucille suggests").font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.mist)
                        Button { host.playSoundscape(reading.tunedSoundscape.mode) } label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Soundscape tuned to your mood").font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                                    Text(reading.tunedSoundscape.title).font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.mist)
                                }
                                Spacer()
                                Image(systemName: "play.fill").foregroundStyle(.white).frame(width: 52, height: 52)
                                    .background(Esc.primaryGradient, in: Circle())
                            }
                            .padding(16)
                            .background(LinearGradient(colors: [Esc.ember.opacity(0.22), Esc.cardSoft], startPoint: .topLeading, endPoint: .bottomTrailing),
                                        in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).strokeBorder(Esc.ember.opacity(0.4), lineWidth: 1))
                        }.buttonStyle(.plain)

                        ForEach(reading.suggestions) { s in
                            Button { host.open(s.deeplink) } label: {
                                HStack(spacing: 12) {
                                    Text(s.minutes).font(EscFont.ui(12, .semibold)).foregroundStyle(Esc.lilac)
                                        .frame(width: 40, height: 40).glass(20)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(s.title).font(EscFont.ui(14, .semibold)).foregroundStyle(Esc.mist)
                                        Text(s.why).font(EscFont.ui(12)).foregroundStyle(Esc.haze).lineLimit(2)
                                    }
                                    Spacer()
                                    Text("+\(s.coins)").font(EscFont.ui(12)).foregroundStyle(Esc.ember)
                                }.padding(14).glass(18)
                            }.buttonStyle(.plain)
                        }
                    }

                    // "Save to Apple Health" hidden until HealthKit (State of Mind, iOS 18+) is set up.

                    if level.unlockedEnergyScan {
                        Button(action: unlock) {
                            HStack(spacing: 12) {
                                Circle().fill(RadialGradient(colors: [Color(hex: 0xFFD0C8), Color(hex: 0xFF3B30)], center: .topLeading, startRadius: 0, endRadius: 20))
                                    .frame(width: 40, height: 40).shadow(color: Color(hex: 0xFF3B30).opacity(0.6), radius: 12)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Energy Scan unlocked").font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.mist)
                                    Text("1,000 Escape Coins · Level 1: Grounding").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                                }
                                Spacer()
                                Image(systemName: "chevron.right").foregroundStyle(Esc.mist)
                            }
                            .padding(16)
                            .background(LinearGradient(colors: [Esc.ember.opacity(0.25), Esc.lilac.opacity(0.2)], startPoint: .topLeading, endPoint: .bottomTrailing),
                                        in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).strokeBorder(Esc.ember.opacity(0.5), lineWidth: 1))
                        }.buttonStyle(.plain)
                    } else {
                        Text("\(level.toNext) coins to your first Energy Scan").font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Text("For wellbeing, not a medical device.").font(EscFont.ui(11)).foregroundStyle(Esc.haze)
                        .frame(maxWidth: .infinity, alignment: .leading).padding(.top, 6)
                }
                .padding(.horizontal, 24).padding(.top, 150).padding(.bottom, 32)
            }
        }
    }
    private func stat(_ big: String, _ small: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(big).font(EscFont.ui(18, .semibold)).foregroundStyle(Esc.mist)
            Text(small).font(EscFont.ui(12)).foregroundStyle(Esc.haze)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: Energy 1 · Start

@available(iOS 17.0, *)
struct EnergyStartChrome: View {
    var level: CoinLevel
    var back: () -> Void
    var begin: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            HStack { GlassIconButton(systemName: "chevron.left", label: "Back", action: back); Spacer() }
            VStack(spacing: 10) {
                Eyebrow(text: "Level 1 unlocked · Grounding", color: Esc.ember)
                Text("Your Energy Scan").font(EscFont.display(30)).foregroundStyle(Esc.mist)
                Text("Lucille reads your seven energy centres from your body, your sleep and how you've felt this week.")
                    .font(EscFont.ui(14)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
            }.padding(.top, 24)
            Spacer()
            VStack(spacing: 10) {
                HStack(spacing: 6) {
                    ForEach(Array(EnergyCenters.levelNames.enumerated()), id: \.offset) { i, _ in
                        Capsule().fill(i == 0 ? Esc.lilac : Color.white.opacity(0.15)).frame(width: 36, height: 6)
                    }
                }
                Text("Every 1,000 Escape Coins lifts you to the next centre.").font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                PrimaryCTA(title: "Begin Energy Scan", action: begin)
            }
        }
        .padding(.horizontal, 24).padding(.top, 56).padding(.bottom, 32)
    }
}

// MARK: Energy 2 · Scan

@available(iOS 17.0, *)
struct EnergyScanChrome: View {
    var bpm: Int
    var reveal: Double
    private var sources: [(String, String)] {
        [("Pulse (camera)", "\(bpm) bpm"), ("HRV · Apple Health", "48 ms"), ("Sleep last night", "6 h 40 m"), ("Mood this week", "Restless, Calm, Foggy")]
    }
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 8) {
                Text("Scanning, root to crown").font(EscFont.display(26)).foregroundStyle(Esc.mist)
                Text("Sit tall and breathe slowly.").font(EscFont.ui(14)).foregroundStyle(Esc.haze)
            }.padding(.top, 60)
            Spacer()
            VStack(spacing: 8) {
                ForEach(Array(sources.enumerated()), id: \.offset) { i, s in
                    HStack { Text(s.0).font(EscFont.ui(13)).foregroundStyle(Esc.haze); Spacer(); Text(s.1).font(EscFont.ui(13, .semibold)).foregroundStyle(Esc.mist) }
                        .padding(.horizontal, 14).padding(.vertical, 10).glass(14)
                        .opacity(reveal > Double(i) * 0.22 ? 1 : 0)
                        .animation(.easeIn(duration: 0.4), value: reveal > Double(i) * 0.22)
                }
            }.padding(.bottom, 40)
        }
        .padding(.horizontal, 24)
    }
}

// MARK: Energy 3 · Result

@available(iOS 17.0, *)
struct EnergyResultChrome: View {
    var close: () -> Void
    var host: ScanHost
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                GlassIconButton(systemName: "xmark", label: "Close", action: close)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Lucille's Energy Centre Scan").font(EscFont.display(22)).foregroundStyle(Esc.mist)
                    Text("Your Connection and Expression centres need gentle space today.")
                        .font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                }
            }.padding(.horizontal, 24).padding(.top, 56)
            HStack { Text("OVERALL STATE").font(EscFont.ui(12)).tracking(1.2).foregroundStyle(Esc.haze) + Text("  · Centred").font(EscFont.ui(12, .semibold)).foregroundStyle(Esc.mist) }
                .glassPill().padding(.top, 14)
            ScrollView {
                VStack(spacing: 10) {
                    // suggestion for the weakest centre
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lucille suggests · Connection needs space").font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                        Text("Open up gently today").font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.mist)
                        HStack(spacing: 8) {
                            ForEach([("Visit Connection World", "escape://realms/connection"),
                                     ("3-min Heart Breathwork", "escape://breath/heart"),
                                     ("Join a Listening Circle", "escape://circles")], id: \.0) { s in
                                Button { host.open(s.1) } label: {
                                    Text(s.0).font(EscFont.ui(13)).foregroundStyle(Esc.mist).glassPill()
                                }.buttonStyle(.plain)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading).padding(16)
                    .background(LinearGradient(colors: [Color(hex: 0x34C759).opacity(0.18), Esc.cardSoft], startPoint: .topLeading, endPoint: .bottomTrailing),
                                in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).strokeBorder(Color(hex: 0x34C759).opacity(0.45), lineWidth: 1))

                    ForEach(EnergyCenters.all) { c in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text(c.name).font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.mist)
                                Spacer()
                                Text(c.status).font(EscFont.ui(11, .semibold)).foregroundStyle(.white)
                                    .padding(.horizontal, 10).padding(.vertical, 4)
                                    .background(c.color.opacity(0.75), in: Capsule())   // solid pill: dark centre colours stay readable
                            }
                            GeometryReader { g in
                                ZStack(alignment: .leading) {
                                    Capsule().fill(.white.opacity(0.1)).frame(height: 6)
                                    Capsule().fill(c.color).frame(width: g.size.width * CGFloat(c.energy) / 100, height: 6)
                                }
                            }.frame(height: 6)
                            Text("\(c.energy)% · \(c.note)").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                        }
                        .padding(16)
                        .background(LinearGradient(colors: [c.color.opacity(0.28), c.color.opacity(0.08)],
                                                   startPoint: .topLeading, endPoint: .bottomTrailing),
                                    in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .glass(20)
                        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .strokeBorder(c.color.opacity(0.45), lineWidth: 1))
                    }
                }
                .padding(.horizontal, 24).padding(.top, 180).padding(.bottom, 32)
            }
        }
    }
}
