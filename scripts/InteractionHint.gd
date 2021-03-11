extends Control
tool

export var text := "Pressione F para interagir" setget set_text
onready var label = $ControlFollow/AlignContainer/Panel/VBoxContainer/Label

func set_text(val: String):
	label.text = val
	text = val
