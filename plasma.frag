#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D fbm;
uniform float time;

const float pi = 3.14159;
const vec3 RED = vec3(1, 0, 0);
const vec3 YELLOW = vec3(1, 1, 0);
const vec3 GREEN = vec3(0, 1, 0);
const vec3 CYAN = vec3(0, 1, 1);
const vec3 BLUE = vec3(0, 0, 1);
const vec3 MAGENTA = vec3(1, 0, 1);

void main()
{
    float r = texture(fbm, vtexCoord).r;
    float v = (sin(2*pi*0.1*time + 2*pi*r) + 1)*3;
    vec3 C;
    if (v < 1) C = mix(RED, YELLOW, fract(v));
    else if (v < 2) C = mix(YELLOW, GREEN, fract(v));
    else if (v < 3) C = mix(GREEN, CYAN, fract(v));
    else if (v < 4) C = mix(CYAN, BLUE, fract(v));
    else if (v < 5) C = mix(BLUE, MAGENTA, fract(v));
    else if (v < 6) C = mix(MAGENTA, RED, fract(v));
    else C = RED;
    fragColor = vec4(C,1.0);
}
