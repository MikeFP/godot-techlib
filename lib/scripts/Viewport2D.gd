extends Viewport
class_name Viewport2D
tool

export var inherit_world_2D := true

func _enter_tree():
	if inherit_world_2D:
		usage = USAGE_2D
		world_2d = get_parent().get_viewport().world_2d

# Returns the `global_position` converted to the local space of a `render_target` rendering
# this viewport.
func to_render_target_local(render_target: CanvasItem, global_position: Vector2):
	return global_position - (render_target.get_global_position() - size * render_target.scale / 2)