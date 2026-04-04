attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform mat4 u_lightViewMat;
uniform mat4 u_lightProjMat;

varying float v_LightDistance;
varying vec2 v_ShadowTexcoord;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1);
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0)).xyz;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    vec4 worldSpace = gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1);
    vec4 cameraSpace = u_lightViewMat * worldSpace;
    vec4 screenSpace = u_lightProjMat * cameraSpace;
    
    v_LightDistance = screenSpace.z / screenSpace.w;
    v_ShadowTexcoord = ((screenSpace.xy / screenSpace.w) * 0.5) + 0.5;
	v_ShadowTexcoord.y = 1.0 - v_ShadowTexcoord.y;
}
