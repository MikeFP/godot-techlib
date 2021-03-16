extends Node

var masks = []
var views = []

func register_view(view):
	views.append(view)

func register_mask(mask: VisualInstance):
	masks.append(mask)

func get_collision_layer_bits(layers: int):
	var layer_array = []
	for i in range(20):
		var mask = 1 << i
		var masked_n = layers & mask
		var bit = masked_n >> i
		layer_array.append(bool(bit))
		return layer_array
	pass

func _physics_process(_delta):
	for view in views:
		view.transfer_all_back()
		var active_masks = get_active_masks(view)
		for mask in active_masks:
			for node in mask.obstructions:
				if node is VisualCollider:
					view.transfer(node.model)

func get_active_masks(view):
	var res = []
	for mask in masks:
		if view.scans(mask.layers):
			res.append(mask)
	return res
