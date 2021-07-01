#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float n = 8;

void main()
{
    if (int(floor(10*n*vtexCoord.s))%10 == 0 || int(floor(10*n*vtexCoord.t))%10 == 0) fragColor = vec4(0);
    else fragColor = vec4(0.8);
}
