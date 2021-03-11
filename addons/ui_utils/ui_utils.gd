tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("AlignContainer", "Container", preload("scripts/AlignContainer.gd"), null)
	add_custom_type("ScreenFollow", "Control", preload("scripts/ScreenFollow.gd"), null)
	add_custom_type("FitPanelContainer", "PanelContainer", preload("scripts/FitPanelContainer.gd"), null)


func _exit_tree():
	pass
