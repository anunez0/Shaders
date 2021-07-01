#version 330 core

in vec2 vvtexCoord;
in vec3 vvertex;
out vec4 fragColor;

uniform mat4 modelViewMatrixInverse;
uniform float time;
uniform sampler2D envmap;

vec4 sampleSphereMap(sampler2D sampler, vec3 V)
{   
  V=normalize(V);
  float z = sqrt((V.z+1.0)/2.0);
  vec2 st = vec2((V.x/(2.0*z)+1.0)/2.0, (V.y/(2.0*z)+1.0)/2.0);
  return texture(sampler, st);
}

void main()
{
    vec3 V = normalize((vec4(vvertex, 1) - modelViewMatrixInverse*vec4(vec3(0), 1)).xyz);
    float degree = time/2;
    V = mat3(vec3(cos(degree), 0, -sin(degree)), vec3(0, 1, 0), vec3(sin(degree), 0, cos(degree)))*V;
    fragColor = sampleSphereMap(envmap, V);
}
