shader_type canvas_item;

vec2 stretched_uv(vec2 uv, vec2 scale, float border_near) {
	vec2 stretch = 1.- scale * border_near;
    return ((uv - .5) * stretch) + .5;
}

void fragment() {
	vec2 st = UV;
    vec4 col = texture(TEXTURE, UV);
	
	st = 1. - st.yx;
	float border_near = 1.-st.x*st.y;
	
	vec2 red_scale = vec2(.015,.01);
	vec2 green_scale = vec2(.005, .0025);
	vec2 blue_scale = vec2(.008, .015);
	
    float r_blur = texture(TEXTURE, stretched_uv(UV, red_scale, border_near)).r;
    float g_blur = texture(TEXTURE, stretched_uv(UV, green_scale, border_near)).g;
    float b_blur = texture(TEXTURE, stretched_uv(UV, blue_scale, border_near)).b;
	
    COLOR = vec4(r_blur, g_blur, b_blur, 1.);
}