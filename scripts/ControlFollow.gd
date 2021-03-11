extends Control

export(NodePath) var target_path
export(Vector2) var offset = Vector2.ZERO
onready var target: Node = get_node(target_path)

func _process(_delta):
	if target != null:
		rect_position = get_viewport().get_camera().unproject_position(target.global_transform.origin) + offset
