precision highp float;

attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform mat4 u_lightViewMatNear;
uniform mat4 u_lightProjMatNear;
varying vec3 v_ShadowCoordNear;

uniform mat4 u_lightViewMatFar;
uniform mat4 u_lightProjMatFar;
varying vec3 v_ShadowCoordFar;

vec3 CorrectShadowCoords(vec3 texcoord)
{
    //Normalize x/y coordinate
    texcoord.xy = 0.5*texcoord.xy + 0.5;
    
    #if defined(_YY_HLSL11_) || defined(_YY_PSSL_)
        //Flip the y-axis on normative platforms
        texcoord.y = 1.0 - texcoord.y;
    #endif
    
    return texcoord;
}

void main()
{
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1);
	v_vNormal = (gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0)).xyz;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    vec4 worldSpace = gm_Matrices[MATRIX_WORLD] * vec4(in_Position, 1);
    
    vec4 cameraSpace = u_lightViewMatNear * worldSpace;
    vec4 screenSpace = u_lightProjMatNear * cameraSpace;
    v_ShadowCoordNear = CorrectShadowCoords(screenSpace.xyz / screenSpace.w);
	
    cameraSpace = u_lightViewMatFar * worldSpace;
    screenSpace = u_lightProjMatFar * cameraSpace;
    v_ShadowCoordFar = CorrectShadowCoords(screenSpace.xyz / screenSpace.w);
}
