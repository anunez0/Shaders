#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
    for (int i = 0; i < 3; ++i) {
        gfrontColor = vec4(0, 0, 0, 1);
        gl_Position = modelViewProjectionMatrixInverse*gl_in[i].gl_Position;
        gl_Position.y = boundingBoxMin.y;
        gl_Position = modelViewProjectionMatrix*gl_Position;
        EmitVertex();
    }
    EndPrimitive();
    if (gl_PrimitiveIDIn == 0) {
        gfrontColor = vec4(0, 1, 1, 1);
        float R = length(boundingBoxMax - boundingBoxMin)/2;
        vec3 C = (boundingBoxMin + boundingBoxMax)/2;
        gl_Position.x = C.x - R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z - R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        gl_Position.x = C.x - R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z + R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        gl_Position.x = C.x + R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z - R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        EndPrimitive();
        gl_Position.x = C.x - R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z + R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        gl_Position.x = C.x + R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z - R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        gl_Position.x = C.x + R;
        gl_Position.y = boundingBoxMin.y - 0.01;
        gl_Position.z = C.z + R;
        gl_Position = modelViewProjectionMatrix*vec4(gl_Position.xyz, 1);
        EmitVertex();
        EndPrimitive();
    }
}
