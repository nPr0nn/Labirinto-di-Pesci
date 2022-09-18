#version 330 core

layout (location = 0) out vec4 fragColor;

in vec2 uv_0;
in vec3 normal;
in vec3 fragPos;

struct Phong_Light{
     vec3 position;
     vec3 Ia;
     vec3 Id;
     vec3 Is;
};

uniform Phong_Light phong_light;
uniform sampler2D u_texture_0;
uniform vec3 camPos;

vec3 getLight(vec3 color){
     vec3 normal_prime         = normalize(normal);

     // Iluminação do ambiente
     vec3 ilumination_ambient  = phong_light.Ia;
     
     // Iluminação difusa
     vec3 light_dir            = normalize(phong_light.position - fragPos);
     float diffuse_power       = max(0, dot(light_dir, normal_prime));
     vec3 ilumination_diffuse  = diffuse_power * phong_light.Id;

     // Iluminação specular
     vec3 view_dir             = normalize(camPos - fragPos);
     vec3 reflect_dir          = reflect(-light_dir, normal_prime);
     float specular_power      = pow(max(dot(view_dir, reflect_dir), 0), 128);
     vec3 ilumination_specular = specular_power * phong_light.Is;

     return color * ( ilumination_ambient + ilumination_diffuse + ilumination_specular );
}

void main(){
     vec3 color = texture(u_texture_0, uv_0).rgb;
     color      = getLight(color);
     fragColor  = vec4(color, 1.0);
}
