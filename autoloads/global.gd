extends Node

var screen_shader: Shader

signal screen_shader_changed

func set_screen_shader(shader: Shader, sender: Node):
	screen_shader = shader
	emit_signal("screen_shader_changed", shader, sender)

func get_collision_layer_bits(layers: int):
	var layer_array = []
	for i in range(20):
		var mask = 1 << i
		var masked_n = layers & mask
		var bit_value = masked_n >> i
		layer_array.append(bool(bit_value))
		return layer_array
	pass

func layers_collide(layers1: int, layers2: int):
	for i in range(20):
		var mask = 1 << i
		var masked_n1 = layers1 & mask
		var masked_n2 = layers2 & mask
		var bit_value1 = masked_n1 >> i
		var bit_value2 = masked_n2 >> i
		if bit_value1 == bit_value2:
			return true
	return false

func get_nearest_parent(node: Node, group: String):
	if !node.is_inside_tree():
		return null
	var path = str(node.get_path())
	var nodes = node.get_tree().get_nodes_in_group(group)
	var parents = []
	for n in nodes:
		var p = str(n.get_path())
		if path.begins_with(p):
			parents.append(p)
	
	var nearest
	for p in parents:
		if nearest == null || p.length() > nearest.length():
			nearest = p
	return node.get_tree().get_root().get_node(nearest)

func get_all_ray_colliders(raycast: RayCast):
	var res = []
	while raycast.is_colliding():
		var col = raycast.get_collider()
		res.append(col)
		raycast.add_exception(col)
		raycast.force_raycast_update()
	for col in res:
		raycast.remove_exception(col)
	return res