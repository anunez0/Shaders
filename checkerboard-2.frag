#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main()
{
    if (int(floor(n*vtexCoord.s) + floor(n*vtexCoord.t))%2 == 0) fragColor = vec4(0.8);
    else fragColor = vec4(0);
}
