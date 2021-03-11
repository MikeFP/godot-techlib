extends RigidBody
class_name Orb

onready var int_area = $InteractionArea
onready var int_ui = $InteractionHint
var activated = false

func _ready():
	deactivate()
	int_area.connect("interacted", self, "_on_interacted")

func _on_interacted():
	if activated:
		deactivate()
	else:
		activate()

func activate():
	activated = true
	int_ui.text = "Pressione F para desativar"
	$Model.material.albedo_color = Color(1.0,1.0,1.0)
	$Model.material.flags_unshaded = false
	_on_activated()

func _on_activated():
	pass

func deactivate():
	activated = false
	int_ui.text = "Pressione F para ativar"
	$Model.material.albedo_color = Color(0,0,0)
	$Model.material.flags_unshaded = false
	_on_deactivated()

func _on_deactivated():
	pass
