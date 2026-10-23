#version 460 core
// Escape v6 — smoke reveal.
//
// Text (or any layer) resolves out of drifting smoke instead of a flat opacity fade:
// fractal noise dissolves the alpha from the bottom up while the pixels settle down into
// place. Running it in reverse lets a line disperse again.
//
// Deliberately gentle: the whole move is ~15 px of drift and one soft noise edge, so it reads
// as "it was always there, the haze cleared" rather than an effect. Keep durations ≥ 700 ms;
// anything faster looks like a glitch. Reduce Motion skips this shader entirely (the Dart side
// falls back to a plain fade).
#include <flutter/runtime_effect.glsl>

precision mediump float;

// NOTE: float uniform indices for setFloat() are, in order:
// 0 uSize.x, 1 uSize.y, 2 uProgress, 3 uSeed, 4 uDrift, 5 uSoftness.
uniform vec2 uSize;

// 0 = fully smoke (invisible), 1 = fully resolved.
uniform float uProgress;

// Decorrelates lines so a stack of text doesn't dissolve in lockstep.
uniform float uSeed;

// How far, in logical pixels, unresolved pixels lift/drift. 0 = dissolve in place.
uniform float uDrift;

// Width of the noise edge, 0.05 (crisp) … 0.6 (very soft).
uniform float uSoftness;

uniform sampler2D uTexture;

out vec4 fragColor;

// --- value noise ------------------------------------------------------------
float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float valueNoise(vec2 p) {
    vec2 i = floor(p);
    vec2 f = fract(p);
    // Smoothstep interpolation keeps the cells from showing as diamonds.
    vec2 u = f * f * (3.0 - 2.0 * f);
    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

// Three octaves is plenty for smoke at text size and stays cheap on older phones.
float fbm(vec2 p) {
    float total = 0.0;
    float amp = 0.5;
    for (int i = 0; i < 3; i++) {
        total += valueNoise(p) * amp;
        p *= 2.02;
        amp *= 0.5;
    }
    return total;
}

void main() {
    vec2 pos = FlutterFragCoord().xy;
    vec2 uv = pos / uSize;

    // Progress eased on the Dart side; clamp defensively.
    float t = clamp(uProgress, 0.0, 1.0);

    // Smoke sits in a fixed field so the texture doesn't swim with the layer's size.
    vec2 noiseUv = vec2(pos.x / max(uSize.x, 1.0) * 3.0, pos.y / max(uSize.y, 1.0) * 1.6);
    float n = fbm(noiseUv * 2.5 + vec2(uSeed * 7.31, uSeed * 3.17 - t * 0.6));

    // Reveal sweeps bottom -> top: pixels low in the layer clear first.
    float sweep = mix(1.15, -0.15, t) + uv.y * 0.35;
    float soft = clamp(uSoftness, 0.02, 0.8);
    float alpha = smoothstep(sweep - soft, sweep + soft, n + t * 0.55);

    // Unresolved pixels are still rising, and lag more where the smoke is thickest.
    float lift = (1.0 - alpha) * uDrift * (0.6 + n * 0.8);
    vec2 samplePos = pos + vec2(n * 2.0 - 1.0, lift);
    vec2 sampleUv = samplePos / uSize;

    // Outside the layer there is nothing to sample; treat as empty rather than clamping the
    // edge row, which would smear the last pixel upward.
    if (sampleUv.y < 0.0 || sampleUv.y > 1.0 || sampleUv.x < 0.0 || sampleUv.x > 1.0) {
        fragColor = vec4(0.0);
        return;
    }

    vec4 src = texture(uTexture, sampleUv);

    // The layer arrives premultiplied, so scaling the whole colour keeps it premultiplied.
    fragColor = src * alpha;
}
