extends Control
tool

export(NodePath) var viewport_content setget set_viewport_content
var content_node: Node

func set_viewport_content(path: NodePath):
	viewport_content = path
	if is_inside_tree():
		if content_node != null:
			$ViewportContainer/Viewport.remove_child(content_node)
			content_node.queue_free()
		content_node = get_node(path)
		$ViewportContainer/Viewport.add_child(content_node)