extends ViewportContainer

export(int, LAYERS_3D_RENDER) var target_layers := 2
export(int, LAYERS_3D_RENDER) var scan_layers := 1

var nodes = []
var original_layers = []

func _ready():
	SpatialMaskController.register_view(self)

func scans(layers: int):
	return layers_collide(scan_layers, layers)

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

func transfer(node: VisualInstance):
	nodes.append(node)
	original_layers.append(node.layers)
	node.layers = target_layers

func transfer_back(node: VisualInstance):
	var i = nodes.find(node)
	var layers = original_layers[i]
	nodes.remove(i)
	original_layers.remove(i)
	node.layers = layers

func transfer_all_back():
	for node in nodes.duplicate():
		transfer_back(node)
