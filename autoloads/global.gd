extends Node

var screen_shader: Shader

signal screen_shader_changed

func set_screen_shader(shader: Shader):
	screen_shader = shader
	emit_signal("screen_shader_changed", shader)
