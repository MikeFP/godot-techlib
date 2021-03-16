extends CollisionObject
class_name VisualCollider
tool

var model: VisualInstance

func _ready():
	update_components()

func _enter_tree():
	update_configuration_warning()

func _process(_delta):
	if !is_inside_tree():
		update_components()
		update_configuration_warning()

func _get_configuration_warning():
	var res = ""
	if model == null:
		res += "You should add a VisualInstance child node. "
	return res

func update_components():
	for c in get_children():
		if c is VisualInstance:
			model = c