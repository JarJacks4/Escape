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
                Text("About a minute. Lay a finger flat over the back camera and flash while you breathe with the orb, then tell Lucille how you feel.")
                    .font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                    .multilineTextAlignment(.center).padding(.bottom, 4)
                HStack(spacing: 8) {
                    ForEach(["Pulse · finger", "How you feel · tap", "A few words"], id: \.self) {
                        Text($0).font(EscFont.ui(12)).foregroundStyle(Esc.mist).glassPill()
                    }
                }
                PrimaryCTA(title: "Start Mood Scan", action: start).padding(.top, 14)
                Button(action: skip) {
                    Text("Skip the camera, just tap how I feel").font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                        .frame(maxWidth: .infinity).frame(height: 44)
                }.buttonStyle(.plain)
                Text("The camera and flash are only used during the pulse read. No photo or video is saved or sent.")
                    .font(EscFont.ui(11)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
            }
        }
        .padding(.horizontal, 24).padding(.top, 56).padding(.bottom, 32)
    }
}

// MARK: Mood 2a · Pulse

@available(iOS 17.0, *)
struct MoodPulseChrome: View {
    /// Measured heart rate, nil until the camera has a steady reading.
    var bpm: Int?
    var status: CameraPulseReader.Status
    /// Live pulse wave from the camera (-1…1), drawn so you can see it's really reading you.
    var wave: [Double]
    var secondsLeft: Int
    var back: () -> Void
    var skip: () -> Void

    private var title: String {
        switch status {
        case .denied: return "Camera is off for Escape"
        case .unavailable: return "No camera available"
        case .reading: return "Hold still, reading your pulse"
        default: return "Cover the back camera"
        }
    }
    private var hint: String {
        switch status {
        case .denied: return "Allow Camera for Escape in Settings to read your pulse, or skip and just tap how you feel."
        case .unavailable: return "This device can't read a pulse with its camera. Skip and tap how you feel."
        case .reading: return "Keep your finger resting lightly over the camera and flash. Breathe in as the orb grows, out as it settles."
        case .starting, .idle: return "Turning on the camera and flash…"
        case .placeFinger: return "Lay a finger flat over the back camera and the flash, covering both. The flash shines through your finger so the camera can see each heartbeat."
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack { GlassIconButton(systemName: "chevron.left", label: "Back", action: back); Spacer() }
            VStack(spacing: 8) {
                Text(title).font(EscFont.display(26)).foregroundStyle(Esc.mist).multilineTextAlignment(.center)
                Text(hint).font(EscFont.ui(14)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
            }.padding(.top, 10)
            Spacer()
            VStack(spacing: 14) {
                if status == .reading || bpm != nil {
                    PulseTrace(wave: wave)
                        .stroke(Esc.ember, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                        .frame(height: 44)
                        .padding(.horizontal, 8)
                        .accessibilityLabel("Live pulse signal from the camera")
                }
                HStack(alignment: .firstTextBaseline, spacing: 6) {
                    Image(systemName: "heart.fill").foregroundStyle(Esc.ember).font(.system(size: 18))
                    Text(bpm.map { "\($0)" } ?? "--").font(EscFont.display(44)).foregroundStyle(Esc.mist)
                    Text("bpm").font(EscFont.ui(14)).foregroundStyle(Esc.haze)
                }
                Text("An estimate for wellbeing only, not for medical use.")
                    .font(EscFont.ui(11)).foregroundStyle(Esc.haze).multilineTextAlignment(.center)
                HStack(spacing: 8) {
                    ForEach(pills, id: \.self) {
                        Text($0).font(EscFont.ui(12)).foregroundStyle(Esc.mist).glassPill()
                    }
                }
                Button(action: skip) { Text(status == .denied || status == .unavailable ? "Continue without pulse" : "Skip pulse")
                    .font(EscFont.ui(14, .medium)).foregroundStyle(Esc.haze)
                    .padding(.horizontal, 18).frame(height: 44).glass(22) }
                    .buttonStyle(.plain).padding(.top, 8)
            }.padding(.bottom, 40)
        }
        .padding(.horizontal, 24).padding(.top, 56).padding(.bottom, 32)
    }

    private var pills: [String] {
        switch status {
        case .reading: return ["Finger detected", bpm == nil ? "Finding your beat" : "Steady signal", "\(secondsLeft) s"]
        case .placeFinger: return ["Camera on", "Flash on", "Waiting for finger"]
        default: return ["Finger", "Back camera"]
        }
    }
}

/// The live pulse wave as a line.
@available(iOS 17.0, *)
struct PulseTrace: Shape {
    var wave: [Double]
    func path(in r: CGRect) -> Path {
        var p = Path()
        guard wave.count > 1 else { return p }
        let step = r.width / CGFloat(wave.count - 1)
        for (i, v) in wave.enumerated() {
            let pt = CGPoint(x: CGFloat(i) * step, y: r.midY - CGFloat(v) * r.height / 2)
            if i == 0 { p.move(to: pt) } else { p.addLine(to: pt) }
        }
        return p
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
                            // Four equal chips, one line each: "Energized" used to wrap to "Energize / d".
                            Text(w).font(EscFont.ui(14, .medium)).foregroundStyle(Esc.mist)
                                .lineLimit(1).minimumScaleFactor(0.75)
                                .padding(.horizontal, 8).frame(maxWidth: .infinity).frame(height: 40)
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
    /// Coins the server awarded for this scan; nil while saving or if it failed.
    var coinsAwarded: Int?
    /// Saving needs the person's OK first (GDPR); shows the "Allow & save" card.
    var needsConsent: Bool = false
    var allowAndSave: () -> Void = {}
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
                CoinBadge(coins: coins, delta: coinsAwarded.flatMap { $0 > 0 ? "+\($0)" : nil })
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
                            stat(reading.pulseMeasured ? "\(reading.bpm)" : "--", reading.pulseMeasured ? "bpm pulse" : "pulse skipped"); stat("\(Int(reading.energy*100))%", "energy"); stat("\(Int(reading.valence*100))%", "pleasant")
                        }
                        Text(reading.because).font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(16).glass(20)

                    if needsConsent {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Save this scan to your mood history?").font(EscFont.ui(14, .semibold)).foregroundStyle(Esc.mist)
                            Text("Lucille uses your check-ins (and your pulse, if measured) for your Mood Orb, Mood Stats and suggestions. You can delete them any time in Privacy.")
                                .font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                            Button(action: allowAndSave) {
                                Text("Allow & save").font(EscFont.ui(14, .semibold)).foregroundStyle(.white)
                                    .padding(.horizontal, 18).frame(height: 40).background(Esc.primaryGradient, in: Capsule())
                            }.buttonStyle(.plain)
                        }.frame(maxWidth: .infinity, alignment: .leading).padding(16).glass(20)
                    }

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

                        ForEach(reading.suggestions + reading.sectionSuggestions) { s in
                            Button { host.open(s.deeplink) } label: {
                                HStack(spacing: 12) {
                                    minutesBadge(s.minutes)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(s.title).font(EscFont.ui(14, .semibold)).foregroundStyle(Esc.mist)
                                        Text(s.why).font(EscFont.ui(12)).foregroundStyle(Esc.haze).lineLimit(2)
                                    }
                                    Spacer(minLength: 4)
                                    if s.coins > 0 {
                                        Text("+\(s.coins)").font(EscFont.ui(12)).foregroundStyle(Esc.ember)
                                    }
                                    Image(systemName: "chevron.right").font(.system(size: 12, weight: .semibold))
                                        .foregroundStyle(Esc.haze)
                                }
                                .padding(14).glass(18)
                                .contentShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
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
                                    Text("\(coins.formatted()) Escape Coins · Level \(level.level): \(level.levelName)").font(EscFont.ui(13)).foregroundStyle(Esc.haze)
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

                    Text("For wellbeing only, not a medical device. The pulse is a camera estimate; if you're worried about your heart, talk to a doctor.").font(EscFont.ui(11)).foregroundStyle(Esc.haze)
                        .frame(maxWidth: .infinity, alignment: .leading).padding(.top, 6)
                }
                .padding(.horizontal, 24).padding(.top, 150).padding(.bottom, 32)
            }
        }
    }
    /// "25 min" as a number over "min", so it never wraps inside the circle.
    private func minutesBadge(_ text: String) -> some View {
        let parts = text.split(separator: " ", maxSplits: 1).map(String.init)
        return VStack(spacing: -1) {
            Text(parts.first ?? text).font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.lilac)
            if parts.count > 1 {
                Text(parts[1]).font(EscFont.ui(10)).foregroundStyle(Esc.haze)
            }
        }
        .lineLimit(1).minimumScaleFactor(0.8)
        .frame(width: 46, height: 46).glass(23)
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
                Text("Lucille maps today's scan, your pulse, energy and mood, onto your seven energy centres. A reflective guide, not a diagnosis.")
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
    var reading: MoodReading
    var reveal: Double
    /// Only what this scan actually measured or the person chose.
    private var sources: [(String, String)] {
        [("Pulse (camera)", reading.pulseMeasured ? "\(reading.bpm) bpm" : "Skipped"),
         ("Energy (you)", "\(Int(reading.energy * 100))%"),
         ("Pleasant (you)", "\(Int(reading.valence * 100))%"),
         ("Today's word", reading.word)]
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
    var reading: MoodReading
    var close: () -> Void
    var host: ScanHost
    private var centers: [EnergyCenter] { EnergyCenters.from(reading) }
    private var weakest: EnergyCenter { centers.min { $0.energy < $1.energy } ?? centers[0] }
    private var weakestShort: String { weakest.name.replacingOccurrences(of: " Energy Center", with: "") }
    private var overall: String {
        let avg = centers.map(\.energy).reduce(0, +) / max(1, centers.count)
        return avg >= 75 ? "Bright" : avg >= 60 ? "Centred" : avg >= 45 ? "Gentle" : "Tender"
    }
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                GlassIconButton(systemName: "xmark", label: "Close", action: close)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Lucille's Energy Centre Scan").font(EscFont.display(22)).foregroundStyle(Esc.mist)
                    Text("Your \(weakestShort) centre could use the most care today.")
                        .font(EscFont.ui(13)).foregroundStyle(Esc.haze)
                }
            }.padding(.horizontal, 24).padding(.top, 56)
            HStack { Text("OVERALL STATE").font(EscFont.ui(12)).tracking(1.2).foregroundStyle(Esc.haze) + Text("  · \(overall)").font(EscFont.ui(12, .semibold)).foregroundStyle(Esc.mist) }
                .glassPill().padding(.top, 14)
            ScrollView {
                VStack(spacing: 10) {
                    // suggestion for the weakest centre
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lucille suggests · \(weakestShort) needs care").font(EscFont.ui(12)).foregroundStyle(Esc.haze)
                        Text("Open up gently today").font(EscFont.ui(15, .semibold)).foregroundStyle(Esc.mist)
                        HStack(spacing: 8) {
                            ForEach([("Visit Connection World", "escape://realms/connection"),
                                     ("3-min Heart Breathwork", "escape://breath/heart"),
                                     ("Calm Soundscape", "escape://mode/calm")], id: \.0) { s in
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

                    ForEach(centers) { c in
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
