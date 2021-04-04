shader_type spatial;

uniform vec4 albedo: hint_color = vec4(1.);
uniform float strength: hint_range(0., 20.) = 0.5;
uniform float brightness = 0.25;
uniform float divisions : hint_range(1., 10.) = 2.;

void fragment() {
	ALBEDO = albedo.rgb;
	SPECULAR = 0.;
	AO = 0.;
}

void light() {
	float cel = floor((dot(NORMAL, LIGHT) + 1.)/2. * (divisions+1.)) / (divisions+1.);
	DIFFUSE_LIGHT = LIGHT_COLOR * strength * 0.5 * cel + brightness;
}