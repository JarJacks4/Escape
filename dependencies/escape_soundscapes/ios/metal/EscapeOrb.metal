// EscapeOrb.metal — SwiftUI port of escape_orb.frag (same look as the FlutterFlow shader
// and the live preview in the build guide). Used by OrbShaderView via .colorEffect().
//
// energy: 0 calm … 10 charged. dream: 0 grounded … 10 dreamy (FlutterFlow slider scale).

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;

static float escHash(float2 p) {
    return fract(sin(dot(p, float2(127.1, 311.7))) * 43758.5453);
}

static float escNoise(float2 p) {
    float2 i = floor(p);
    float2 f = fract(p);
    float2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(escHash(i), escHash(i + float2(1.0, 0.0)), u.x),
               mix(escHash(i + float2(0.0, 1.0)), escHash(i + float2(1.0, 1.0)), u.x), u.y);
}

[[ stitchable ]] half4 escapeOrb(float2 position, half4 color, float2 size,
                                 float time, float energy, float dream) {
    const float3 night  = float3(0.043, 0.071, 0.188); // #0B1230
    const float3 royal  = float3(0.224, 0.318, 0.624); // #39519F
    const float3 violet = float3(0.557, 0.486, 0.851); // #8E7CD9
    const float3 lilac  = float3(0.725, 0.639, 0.941); // #B9A3F0
    const float3 ember  = float3(0.937, 0.467, 0.008); // #EF7702

    float2 uv = (position - float2(0.5, 0.45) * size) / size.y;
    float e = clamp(energy / 10.0, 0.0, 1.0);
    float d = clamp(dream / 10.0, 0.0, 1.0);
    float t = time;

    float r = length(uv);
    float a = atan2(uv.y, uv.x);

    // Breathing cycle: 9 s when calm, 4 s when charged
    float radius = 0.17 + 0.015 * sin(t * 6.28318 / mix(9.0, 4.0, e));
    float wobble = (0.006 + 0.02 * d) * sin(3.0 * a + t * 0.8) + 0.006 * sin(5.0 * a - t * 1.1);

    float q = (r - radius - wobble) * mix(22.0, 12.0, d);
    float ring = exp(-q * q);
    float h = (r - radius) * 5.0;
    float halo = exp(-h * h) * 0.35;
    float core = exp(-r * 3.0) * 0.45;
    float mist = escNoise(uv * 3.0 + float2(t * 0.05, -t * 0.03)) * 0.08 * (0.5 + d);

    float3 col = night;
    col += royal * (core + mist);
    col += violet * halo;
    col += mix(lilac, mix(lilac, ember, 0.35), e * 0.6) * ring;
    col *= 1.0 - smoothstep(0.55, 1.1, r) * 0.6;

    return half4(half3(col), 1.0h);
}
