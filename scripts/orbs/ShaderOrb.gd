extends Orb

export(Shader) var shader
var last_sender

func _ready():
	Global.connect("screen_shader_changed", self, "_check_deactivate")

func _check_deactivate(_new_shader, sender):
	last_sender = sender
	if activated && sender != self:
		deactivate()

func _on_activated():
	Global.set_screen_shader(shader, self)

func _on_deactivated():
	if last_sender == self:
		Global.set_screen_shader(null, self)
