shader_type canvas_item;

void fragment() {
	vec2 st = UV;
	vec3 col = texture(TEXTURE, UV).xyz;
	st *=  1. - st.yx;
    float vig = st.x * st.y * 15.0;
	vig = 1.-pow(vig, 0.25);
	col = mix(col, vec3(0.), vig);
	COLOR.xyz = col; 
}