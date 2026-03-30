varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

void main()
{
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 L1 = normalize(vec3(1));
	vec3 C1 = vec3(1);
	vec3 L2 = normalize(vec3(-1, -1, 0));
	vec3 C2 = vec3(0.4);
	vec3 ambient = vec3(0.1);
	
	float NdotL = dot(normalize(v_vNormal), L1);
	vec3 light = ambient + NdotL * C1;
	
	NdotL = dot(normalize(v_vNormal), L2);
	light += NdotL * C2;
	
	gl_FragColor.rgb *= clamp(light, vec3(0), vec3(1));
}
