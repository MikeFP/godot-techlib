extends Orb

export(Shader) var shader

func _on_activated():
	Global.set_screen_shader(shader)

func _on_deactivated():
	Global.set_screen_shader(null)
