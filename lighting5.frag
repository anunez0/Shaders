#version 330 core

in vec3 N;
in vec3 L;
in vec3 V;
out vec4 fragColor;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

void main()
{
    vec3 NF = normalize(N);
    vec3 LF = normalize(L);
    vec3 VF = normalize(V);
    vec3 R = 2*dot(NF, LF)*NF - LF;
    fragColor = matAmbient*lightAmbient + matDiffuse*lightDiffuse*max(0, dot(NF, LF));
    if (dot(NF, LF) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R, VF)), matShininess);
}
