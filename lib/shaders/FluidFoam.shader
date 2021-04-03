shader_type canvas_item;

uniform sampler2D displacement_texture;
uniform float foam_length = .35;
uniform float min_foam_length = .0;
uniform vec2 foam_velocity = vec2(.0,-.02);
uniform vec4 foam_color : hint_color = vec4(1.);

void fragment() {
	vec3 displ = texture(displacement_texture, UV + TIME * foam_velocity).ggg;
	float extra_length = foam_length - min_foam_length;
	
	float threshold = min_foam_length + displ.y * extra_length;
	float foam = smoothstep(UV.y - 0.05, UV.y, threshold);
	
	COLOR = vec4(foam_color.rgb, foam_color.a * foam);
}