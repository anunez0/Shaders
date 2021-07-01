#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float time;
uniform float slice = 1/30.0;
uniform sampler2D explosion;

void main()
{
    vec2 texCoord = vtexCoord;
    texCoord.x = 1/8.0*(texCoord.x + int(floor(time/slice))%8);
    texCoord.y = 1/6.0*(texCoord.y + 5 - int(floor(time/slice/8))%6);
    fragColor = texture(explosion, texCoord);
    fragColor *= fragColor.a;
}
