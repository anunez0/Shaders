#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform bool full = false;

void main()
{
    vtexCoord = texCoord;
    if (!full) gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    else {
        gl_Position.xy = vertex.xy;
        gl_Position.z = 0;
        gl_Position.w = 1;
    }
}
