#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec3 N;
out vec3 L1;
out vec3 L2;
out vec3 L3;
out vec3 L4;
out vec3 L5;
out vec3 L6;
out vec3 L7;
out vec3 L8;
out vec3 V;

uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main()
{
    N = normalMatrix * normal;
    vec4 light1 = vec4(boundingBoxMin, 1);
    L1 = (modelViewMatrix*(light1) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light2 = vec4(boundingBoxMin, 1);
    light2.x += boundingBoxMax.x - boundingBoxMin.x;
    L2 = (modelViewMatrix*(light2) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light3 = vec4(boundingBoxMin, 1);
    light3.y += boundingBoxMax.y - boundingBoxMin.y;
    L3 = (modelViewMatrix*(light3) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light4 = vec4(boundingBoxMin, 1);
    light4.z += boundingBoxMax.z - boundingBoxMin.z;
    L4 = (modelViewMatrix*(light4) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light5 = vec4(boundingBoxMin, 1);
    light5.x += boundingBoxMax.x - boundingBoxMin.x;
    light5.y += boundingBoxMax.y - boundingBoxMin.y;
    L5 = (modelViewMatrix*(light5) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light6 = vec4(boundingBoxMin, 1);
    light6.x += boundingBoxMax.x - boundingBoxMin.x;
    light6.z += boundingBoxMax.z - boundingBoxMin.z;
    L6 = (modelViewMatrix*(light6) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light7 = vec4(boundingBoxMin, 1);
    light7.y += boundingBoxMax.y - boundingBoxMin.y;
    light7.z += boundingBoxMax.z - boundingBoxMin.z;
    L7 = (modelViewMatrix*(light7) - modelViewMatrix*vec4(vertex, 1)).xyz;
    vec4 light8 = vec4(boundingBoxMax, 1);
    L8 = (modelViewMatrix*(light8) - modelViewMatrix*vec4(vertex, 1)).xyz;
    V = (-modelViewMatrix*vec4(vertex, 1)).xyz;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
