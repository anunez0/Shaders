#version 330 core

in vec3 N;
in vec3 L1;
in vec3 L2;
in vec3 L3;
in vec3 L4;
in vec3 L5;
in vec3 L6;
in vec3 L7;
in vec3 L8;
in vec3 V;
out vec4 fragColor;

uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

void main()
{
    vec3 NF = normalize(N);
    vec3 L1F = normalize(L1);
    vec3 L2F = normalize(L2);
    vec3 L3F = normalize(L3);
    vec3 L4F = normalize(L4);
    vec3 L5F = normalize(L5);
    vec3 L6F = normalize(L6);
    vec3 L7F = normalize(L7);
    vec3 L8F = normalize(L8);
    vec3 VF = normalize(V);
    vec3 R1 = 2*dot(NF, L1F)*NF - L1F;
    vec3 R2 = 2*dot(NF, L2F)*NF - L2F;
    vec3 R3 = 2*dot(NF, L3F)*NF - L3F;
    vec3 R4 = 2*dot(NF, L4F)*NF - L4F;
    vec3 R5 = 2*dot(NF, L5F)*NF - L5F;
    vec3 R6 = 2*dot(NF, L6F)*NF - L6F;
    vec3 R7 = 2*dot(NF, L7F)*NF - L7F;
    vec3 R8 = 2*dot(NF, L8F)*NF - L8F;
    fragColor = matDiffuse*lightDiffuse*(max(0, dot(NF, L1F)) + max(0, dot(NF, L2F)) + max(0, dot(NF, L3F)) + max(0, dot(NF, L4F)) + max(0, dot(NF, L5F)) + max(0, dot(NF, L6F)) + max(0, dot(NF, L7F)) + max(0, dot(NF, L8F)))/2;
    if (dot(NF, L1F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R1, VF)), matShininess);
    if (dot(NF, L2F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R2, VF)), matShininess);
    if (dot(NF, L3F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R3, VF)), matShininess);
    if (dot(NF, L4F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R4, VF)), matShininess);
    if (dot(NF, L5F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R5, VF)), matShininess);
    if (dot(NF, L6F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R6, VF)), matShininess);
    if (dot(NF, L7F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R7, VF)), matShininess);
    if (dot(NF, L8F) >= 0) fragColor += matSpecular*lightSpecular*pow(max(0, dot(R8, VF)), matShininess);
}
