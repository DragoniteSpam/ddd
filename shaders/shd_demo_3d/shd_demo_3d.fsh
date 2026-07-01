precision highp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_vNormal;

uniform sampler2D samp_shadowmap_near;
varying vec3 v_ShadowCoordNear;

uniform sampler2D samp_shadowmap_far;
varying vec3 v_ShadowCoordFar;

float SampleShadowmap(sampler2D sampler, vec2 texcoord)
{
    #if defined(_YY_HLSL11_) || defined(_YY_PSSL_)
        return texture2D(sampler, texcoord).r;
    #else
        return 2.0*texture2D(sampler, texcoord).r - 1.0;
    #endif
}

void main()
{
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 L1 = normalize(vec3(1));
	vec3 C1 = vec3(1);
	vec3 L2 = normalize(vec3(-1, -1, 0));
	vec3 C2 = vec3(0.4);
	vec3 ambient = vec3(0.1);
	
	float shadow_bias = 0.001;
	
	float NdotL = dot(normalize(v_vNormal), L1);
	vec3 light = ambient + NdotL * C1;
	
	if (v_ShadowCoordNear == clamp(v_ShadowCoordNear, 0.0, 1.0)) {
	    if (v_ShadowCoordNear.z > SampleShadowmap(samp_shadowmap_near, v_ShadowCoordNear.xy) + shadow_bias) {
	        light = ambient;
	    }
	}
	else if (v_ShadowCoordFar == clamp(v_ShadowCoordFar, 0.0, 1.0)) {
	    if (v_ShadowCoordFar.z > SampleShadowmap(samp_shadowmap_far, v_ShadowCoordFar.xy) + shadow_bias) {
	        light = ambient;
	    }
	}
    
	NdotL = dot(normalize(v_vNormal), L2);
	light += NdotL * C2;
	
	gl_FragColor.rgb *= clamp(light, vec3(0), vec3(1));
}
