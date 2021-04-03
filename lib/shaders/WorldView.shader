shader_type canvas_item;

uniform sampler2D view_texture;

void fragment() {
	COLOR = texture(view_texture, SCREEN_UV);
	COLOR = vec4(1.);
}