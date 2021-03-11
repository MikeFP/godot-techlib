extends Label

export var node_path: NodePath
export var update_signal: String
export var value_in_signal := false
export var property_name: String
export var content := "$value"

onready var node := get_node(node_path)

func _ready():
	if property_name != "":
		_on_signal_fired(_get_property())
	if update_signal != "":
		node.connect(update_signal, self, "_on_signal_fired")

func _on_signal_fired(value = null):
	if !value_in_signal:
		value = _get_property()
	text = content.replace("$value", str(value))
	
func _get_property():
	return node.get(property_name)
