extends Area

export(NodePath) var ui_path: NodePath
export var interact_action := "interact"

signal interacted

var ui_node
var bodies = []
var player_count = 0

func _ready():
	if ui_path != "":
		ui_node = get_node(ui_path)
		ui_node.hide()
	connect("body_entered", self, "_on_body_entered")
	connect("body_exited", self, "_on_body_exited")

func _process(_delta):
	if player_count > 0 && Input.is_action_just_pressed(interact_action):
		emit_signal("interacted")

func _on_body_entered(body):
	bodies.append(body)
	if body.is_in_group("player"):
		player_count += 1
		if ui_node != null:
			ui_node.show()

func _on_body_exited(body):
	bodies.erase(body)
	if body.is_in_group("player"):
		player_count -= 1
		if player_count <= 0 && ui_node != null:
			ui_node.hide()
