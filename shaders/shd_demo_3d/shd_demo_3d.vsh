attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform mat4 u_lightViewMatNear;
uniform mat4 u_lightProjMatNear;

varying float v_LightDistanceNear;
varying vec2 v_ShadowTexcoordNear;

uniform mat4 u_lightViewMatFar;
uniform mat4 u_lightProjMatFar;

varying float v_LightDistanceFar;
varying vec2 v_ShadowTexcoordFar;

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1);
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0)).xyz;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    vec4 worldSpace = gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1);
    vec4 cameraSpace = u_lightViewMatNear * worldSpace;
    vec4 screenSpace = u_lightProjMatNear * cameraSpace;
    
    v_LightDistanceNear = screenSpace.z / screenSpace.w;
    v_ShadowTexcoordNear = ((screenSpace.xy / screenSpace.w) * 0.5) + 0.5;
	v_ShadowTexcoordNear.y = 1.0 - v_ShadowTexcoordNear.y;
	
    cameraSpace = u_lightViewMatFar * worldSpace;
    screenSpace = u_lightProjMatFar * cameraSpace;
    
    v_LightDistanceFar = screenSpace.z / screenSpace.w;
    v_ShadowTexcoordFar = ((screenSpace.xy / screenSpace.w) * 0.5) + 0.5;
	v_ShadowTexcoordFar.y = 1.0 - v_ShadowTexcoordFar.y;
}
