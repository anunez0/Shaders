#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

void main()
{
    if (sqrt(pow(vtexCoord.s - 0.5, 2) + pow(vtexCoord.t - 0.5, 2)) <= 0.2) fragColor = vec4(1, 0, 0, 1);
    else fragColor = vec4(1);
}
