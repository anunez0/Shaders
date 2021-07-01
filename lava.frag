#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D noise0;
uniform float time;

const vec4 BLACK = vec4(0, 0, 0, 1);
const vec4 RED = vec4(1, 0, 0, 1);
const vec4 YELLOW = vec4(1, 1, 0, 1);

void main()
{
    float f = texture(noise0, vtexCoord + vec2(time/4, time/4)).x;
    if (f < 0.5) fragColor = mix(BLACK, RED, 2*f);
    else if (f < 1) fragColor = mix(RED, YELLOW, 2*f - 1);
    else fragColor = YELLOW;
}
