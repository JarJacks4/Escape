// MoodOrb.metal — the reactive Mood Orb for the Mood & Energy Scan flow.
//
// Unlike EscapeOrb (the ambient NowPlaying orb), this one is driven live by what the
// scan is reading, so the person sees their own state in it:
//   • tint     — the mood's colour (computed in Swift from energy × valence), so the
//                orb *is* the mood Lucille names.
//   • valence  — 0 unpleasant … 1 pleasant. Cools / warms and tightens / opens the ring.
//   • energy   — 0 drained … 1 charged. Faster breath, more wobble, wider shed.
//   • beat     — a 0…1 heartbeat throb sent each frame from the measured pulse: the orb
//                visibly beats with the scan.
//   • texture  — 0 crisp … 1 dreamy. Softer edge and more mist.
//
// Driven by MoodOrbView via .colorEffect(). Pair with the app's reduce-motion handling.

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

static float moodHash(float2 p) {
    return fract(sin(dot(p, float2(127.1, 311.7))) * 43758.5453);
}

static float moodNoise(float2 p) {
    float2 i = floor(p);
    float2 f = fract(p);
    float2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(moodHash(i), moodHash(i + float2(1.0, 0.0)), u.x),
               mix(moodHash(i + float2(0.0, 1.0)), moodHash(i + float2(1.0, 1.0)), u.x), u.y);
}

[[ stitchable ]] half4 moodOrb(float2 position, half4 color, float2 size,
                               float time, float energy, float valence,
                               float beat, float texture, float recolorStrength,
                               float3 tint) {

    float e = clamp(energy, 0.0, 1.0);
    float v = clamp(valence, 0.0, 1.0);
    float d = clamp(texture, 0.0, 1.0);
    float recolor = clamp(recolorStrength, 0.0, 1.0);
    float t = time;

    float2 uv = (position - float2(0.5, 0.45) * size) / size.y;
    float r = length(uv);
    float a = atan2(uv.y, uv.x);

    // --- TIMING: breath + heartbeat ---
    // Breath period shortens with energy (9 s calm → 4 s charged). The heartbeat `beat`
    // adds a short outward throb on top, so the ring literally pulses with the scan.
    float breath = 0.015 * sin(t * 6.28318 / mix(9.0, 4.0, e));
    float throb = 0.028 * beat;
    float radius = 0.17 + breath + throb;

    // --- SHAPE: wobble grows with energy, edge softens with texture ---
    float amp = 0.006 + 0.02 * d;
    float wobble = amp * sin(3.0 * a + t * 0.8)
                 + 0.006 * sin(5.0 * a - t * 1.1);
    float sharp = mix(22.0, 12.0, d);                 // matches the Soundscapes Escape orb

    float q = (r - radius - wobble) * sharp;
    float ring = exp(-q * q);
    float h = (r - radius) * 5.0;
    float halo = exp(-h * h) * (0.35 + 0.15 * beat);  // halo flares a touch on each beat
    float core = exp(-r * 3.0) * 0.45;
    float mist = moodNoise(uv * 3.0 + float2(t * 0.05, -t * 0.03)) * 0.08 * (0.5 + d);

    // Shed particles drift outward when dreamy / charged (grainy ring of specks)
    float speck = moodNoise(uv * 22.0 - float2(t * 0.6, t * 0.2));
    float shedBand = exp(-pow((r - radius - 0.06 - 0.05 * e) * 10.0, 2.0));
    float shed = step(0.82 - 0.25 * d, speck) * shedBand * (0.25 + 0.5 * d);

    // --- COLOUR: the Soundscapes blue-purple orb, progressively recoloured by the scan ---
    float3 royal = float3(0.224, 0.318, 0.624);       // #39519F
    float3 violet = float3(0.557, 0.486, 0.851);      // #8E7CD9
    float3 lilac = float3(0.725, 0.639, 0.941);       // #B9A3F0
    float3 moodAccent = mix(lilac, tint, recolor);
    float3 moodCore = mix(royal, mix(royal, tint, 0.35), recolor * v);

    float3 col = float3(0.0);                         // additive light over a transparent base
    col += moodCore * (core + mist);
    col += mix(violet, moodAccent, 0.45 * recolor) * halo;
    col += moodAccent * ring;
    col += moodAccent * shed;
    col *= 1.0 - smoothstep(0.55, 1.1, r) * 0.6;      // vignette
    col *= 1.0 - smoothstep(0.30, 0.48, r);           // fade out before the frame edge

    // Premultiplied: the glow sits on whatever is behind the orb (no dark square).
    col = clamp(col, 0.0, 1.0);
    float alpha = max(col.r, max(col.g, col.b));
    return half4(half3(col), half(alpha));
}
