extends Node

onready var shader_container = $PostProcessingContainer

func _ready():
	Global.connect("screen_shader_changed", self, "_on_shader_changed")

func _on_shader_changed(shader: Shader):
	shader_container.material.shader = shader