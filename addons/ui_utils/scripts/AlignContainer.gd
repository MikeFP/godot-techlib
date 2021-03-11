extends Container
tool

export(String, "CENTER") var alignment = "CENTER"
onready var node: Control = get_child(0)

var overriding = false

func _ready():
	align()
	node.connect("item_rect_changed", self, "align")

func align():
	if overriding:
		return
	overriding = true
	match alignment:
		"CENTER":
			node.rect_position = -node.rect_size/2
	overriding = false
