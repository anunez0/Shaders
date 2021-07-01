#version 330 core

in vec2 gtexCoord;
in float glayer;
out vec4 fragColor;

uniform sampler2D furTexture;

void main()
{
    if (glayer == 0) fragColor = vec4(0.3*vec3(0.6, 0.46, 0.33), 1);
    else {
        if (texture(furTexture, gtexCoord).a < 0.01) discard;
        else fragColor = vec4((0.7*((glayer - 1)/8.0) + 0.3)*vec3(0.6, 0.46, 0.33), 1);
    }
}
