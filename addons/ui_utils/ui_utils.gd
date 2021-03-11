tool
extends EditorPlugin


func _enter_tree():
	_clear_types()
	add_custom_type("AlignContainer", "Container", preload("scripts/AlignContainer.gd"), null)
	add_custom_type("ScreenFollow", "Control", preload("scripts/ScreenFollow.gd"), null)
	add_custom_type("FitPanelContainer", "PanelContainer", preload("scripts/FitPanelContainer.gd"), null)
	add_custom_type("DynamicLabel", "Label", preload("scripts/DynamicLabel.gd"), null)


func _exit_tree():
	pass

func _clear_types():
	remove_custom_type("AlignContainer")
	remove_custom_type("ScreenFollow")
	remove_custom_type("FitPanelContainer")
	remove_custom_type("DynamicLabel")