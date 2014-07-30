#version 330

layout(location = 0) in vec4 position;

uniform mat4 worldViewProj;

void main()
{
    gl_Position =  (position + vec4(0, 0, -50, 1.0)) * worldViewProj;
}