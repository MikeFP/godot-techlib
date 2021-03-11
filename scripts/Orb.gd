extends RigidBody
class_name Orb

export var description := "Regular Orb"

onready var int_area = $InteractionArea
var activated = false

signal int_ui_text

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
	emit_signal("int_ui_text", "[ F ] Desativar")
	$Model.material.albedo_color = Color(1.0,1.0,1.0)
	$Model.material.flags_unshaded = false
	_on_activated()

func _on_activated():
	pass

func deactivate():
	activated = false
	emit_signal("int_ui_text", "[ F ] Ativar")
	$Model.material.albedo_color = Color(0,0,0)
	$Model.material.flags_unshaded = false
	_on_deactivated()

func _on_deactivated():
	pass
