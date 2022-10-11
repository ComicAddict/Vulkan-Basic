#version 450

layout(binding = 0) uniform UniformBufferObject{
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

mat4 getTranslation(vec3 delta){
    mat4 m = mat4(0.0f);
    m[0][0] = 1;
    m[1][1] = 1;
    m[2][2] = 1;
    m[3] = vec4(delta, 1.0f);
    return m;
}

void main() {
    float gridSpace = 2.0f;
    mat4 modelInstance = getTranslation(vec3(gridSpace*(gl_InstanceIndex%70),gridSpace*floor(gl_InstanceIndex/70.0),0.0)+vec3(-gridSpace*35.0,-gridSpace*35.0,0.0));
    gl_Position = ubo.proj * ubo.view * modelInstance * ubo.model * vec4(inPosition, 1.0);
    fragColor = inColor;
    fragTexCoord = inTexCoord;
}
