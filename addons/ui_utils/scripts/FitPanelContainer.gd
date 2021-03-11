extends PanelContainer

var overriding = false

func _enter_tree():
	connect("sort_children", self, "fit")

func fit():
	if overriding:
		return
	overriding = true
	rect_size = rect_min_size
	overriding = false
