extends PanelContainer

func _enter_tree():
	connect("sort_children", self, "fit")

func fit():
	rect_size = rect_min_size
