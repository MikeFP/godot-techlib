extends Control
tool

export var text := "Pressione F para interagir" setget set_text
onready var label = $ScreenFollow/Align/Panel/VBox/Label

func set_text(val: String):
	label.text = val
	text = val
