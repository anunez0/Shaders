#version 330 core

in vec2 vtexCoord;
out vec4 fragColor;

uniform bool plot = true;
uniform float edge0 = 0.1;
uniform float edge1 = 0.9;
uniform float width = 0.015;

void main()
{
    float s = vtexCoord.s;
    float t = vtexCoord.t;
    float v = smoothstep(edge0, edge1, s);
    if (!plot) fragColor = vec4(vec3(v), 1);
    else {
        if (abs(v - t) <= width/2) fragColor = vec4(vec3(0, 1, 0), 1);
        else fragColor = vec4(vec3(v), 1);
    }
}
