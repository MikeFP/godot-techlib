extends Node

onready var shader_view = $ShaderView

func _ready():
	Global.connect("screen_shader_changed", self, "_on_shader_changed")

func _on_shader_changed(shader: Shader):
	shader_view.material.shader = shader