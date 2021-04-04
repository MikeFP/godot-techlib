extends Node2D

export(PackedScene) var ripple_scene := preload("res://lib/scenes/WaterRipples.tscn")
onready var ripple_view = $RippleViewport

func _ready():
	ripple(Vector2(0, 128))

func ripple(position: Vector2):
	var ripple = ripple_scene.instance()
	ripple_view.add_child(ripple)
	ripple.global_position = ripple_view.to_render_target_local($Ripples, position)
	ripple.emitting = true
