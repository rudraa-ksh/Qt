// water.frag
#version 440

layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;

// Strict std140 layout for Qt 6
layout(std140, binding = 0) uniform ubuf {
    mat4 qt_Matrix;      // 0-63
    float qt_Opacity;    // 64-67
    float time;          // 68-71
    float fill;          // 72-75
    float padding;       // 76-79 (Crucial padding for 16-byte alignment)
    vec4 waterColor;     // 80-95
} u;

void main() {
    vec2 uv = qt_TexCoord0;

    // --- 1. The "Slosh" (Primary Wave) ---
    // Frequency is low (3.0) so it looks like one big side-to-side motion
    float primaryWave = 0.025 * sin(uv.x * 1.0 + u.time * 1.2);

    // --- 2. The "Micro-Ripple" (Surface Detail) ---
    // High frequency (15.0) but very low amplitude (0.005)
    float ripple = 0.005 * sin(uv.x * 5.0 - u.time * 2.5);

    // Combine them
    float totalWave = primaryWave + ripple;

    // --- 3. Filling Calculation ---
    // We calculate where the water surface is
    float threshold = (1.0 - u.fill) + totalWave;

    // Smoothstep for a clean, non-jagged edge
    float alpha = smoothstep(threshold, threshold + 0.003, uv.y);

    // --- 4. Depth Gradient (Optional for Realism) ---
    // Makes the bottom of the water slightly darker than the top
    float depth = smoothstep(threshold + 0.3, threshold, uv.y);
    vec4 finalColor = mix(u.waterColor * 0.8, u.waterColor, depth);

    fragColor = finalColor * alpha * u.qt_Opacity;
}