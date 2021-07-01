#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

const vec3 RED = vec3(1, 0, 0);
const vec3 YELLOW = vec3(1, 1, 0);
const vec3 GREEN = vec3(0, 1, 0);
const vec3 CYAN = vec3(0, 1, 1);
const vec3 BLUE = vec3(0, 0, 1);

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
    float y = 2*(gl_Position.y/gl_Position.w + 1);
    vec3 C;
    if (y < 1) C = mix(RED, YELLOW, fract(y));
    else if (y < 2) C = mix(YELLOW, GREEN, fract(y));
    else if (y < 3) C = mix(GREEN, CYAN, fract(y));
    else if (y < 4) C = mix(CYAN, BLUE, fract(y));
    else C = BLUE;
    frontColor = vec4(C,1.0);
}
