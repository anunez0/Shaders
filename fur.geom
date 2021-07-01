#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec3 vnormal[];
in vec2 vtexCoord[];
out vec2 gtexCoord;
out float glayer;

uniform mat4 modelViewProjectionMatrix;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main( void )
{
    float d = length(boundingBoxMax - boundingBoxMin)/1000;
    for (int layer = 0; layer < 10; ++layer) {
        glayer = layer;
        for (int i = 0; i < 3; ++i) {
            gtexCoord = vtexCoord[i];
            vec3 V = (gl_in[i].gl_Position).xyz;
            vec3 N = vnormal[i];
            gl_Position = modelViewProjectionMatrix*vec4(V + (layer*d)*N, 1);
            EmitVertex();
        }
        EndPrimitive();
    }
}
