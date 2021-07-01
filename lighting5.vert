#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec3 N;
out vec3 L;
out vec3 V;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 viewMatrixInverse;
uniform mat3 normalMatrix;
uniform vec4 lightPosition;
uniform bool world;

void main()
{
    N = normalMatrix * normal;
    L = (lightPosition - modelViewMatrix*vec4(vertex, 1)).xyz;
    V = (-modelViewMatrix*vec4(vertex, 1)).xyz;
    if (world) {
        N = (viewMatrixInverse*vec4(N, 0)).xyz;
        L = (viewMatrixInverse*vec4(L, 0)).xyz;
        V = (viewMatrixInverse*vec4(V, 0)).xyz;
    }
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
