#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
uniform float amp = 0.5;
uniform float freq = 0.25;

const float PI = 3.141592;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;
    vec3 V = mat3(vec3(1, 0, 0), vec3(0, cos(amp*sin(2*PI*freq*time + vertex.y)), sin(amp*sin(2*PI*freq*time + vertex.y))), vec3(0, -sin(amp*sin(2*PI*freq*time + vertex.y)), cos(amp*sin(2*PI*freq*time + vertex.y))))*vertex;
    gl_Position = modelViewProjectionMatrix * vec4(V, 1.0);
}
