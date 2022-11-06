#version 330 core

layout ( location = 0) in vec2 in_texcoord_0;
layout ( location = 1) in vec3 in_normal;
layout ( location = 2) in vec3 in_position;

out vec2 uv_0;
out vec3 normal;
out vec3 fragPos;

uniform mat4 proj_m;
uniform mat4 view_m;
uniform mat4 model_m;

void main(){
     uv_0    = in_texcoord_0;
     fragPos = vec3(model_m * vec4(in_position, 1.0));
     normal  = mat3(transpose(inverse(model_m))) * normalize(in_normal);
     gl_Position = proj_m * view_m * model_m * vec4(in_position, 1.0);
}
