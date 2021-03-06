#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

void main()
{
    float f = texture(noise0, vtexCoord).x;
    if (f < 1) fragColor = mix(texture(rock1, vtexCoord), texture(grass2, vtexCoord), f);
    else fragColor = texture(grass2, vtexCoord);
}
