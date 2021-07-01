#version 330 core

in vec4 frontColor;
in vec3 V;
out vec4 fragColor;

void main()
{
    fragColor = frontColor*normalize(cross(dFdx(V), dFdy(V))).z;
}
