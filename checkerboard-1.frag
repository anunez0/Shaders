#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    if (int(floor(8*vtexCoord.s) + floor(8*vtexCoord.t))%2 == 0) fragColor = vec4(0.8);
    else fragColor = vec4(0);
}
