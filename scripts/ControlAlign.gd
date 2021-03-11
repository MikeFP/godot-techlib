extends Control
tool

export(String, "CENTER") var alignment = "CENTER"
onready var node: Control = get_child(0)

func _ready():
	node.connect("item_rect_changed", self, "align")
	align()

func align():
	match alignment:
		"CENTER":
			node.rect_position = -node.rect_size/2