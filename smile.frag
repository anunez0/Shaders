#version 330 core

in vec2 vtexCoord;
in vec2 d;
out vec4 fragColor;

uniform sampler2D colormap;

void main()
{
    vec2 C1 = vec2(0.34, 0.65) + d;
    vec2 C2 = vec2(0.66, 0.65) + d;
    fragColor = texture(colormap, vtexCoord);
    if (length(vtexCoord - C1) <= 0.05 || length(vtexCoord - C2) <= 0.05) fragColor = vec4(0);
}
