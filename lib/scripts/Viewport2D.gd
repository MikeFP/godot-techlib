extends Viewport
tool

export var inherit_world_2D := true

func _enter_tree():
	if inherit_world_2D:
		usage = USAGE_2D
		world_2d = get_parent().get_viewport().world_2d
