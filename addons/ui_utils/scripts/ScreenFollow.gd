extends Control

export(NodePath) var target_path
export(Vector3) var world_offset = Vector3.ZERO
export(Vector2) var screen_offset = Vector2.ZERO
onready var target: Node = get_node(target_path)

func _process(_delta):
	if target != null:
		rect_position = get_viewport().get_camera().unproject_position(target.global_transform.origin + world_offset) + screen_offset
