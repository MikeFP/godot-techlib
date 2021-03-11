extends KinematicBody

var speed := 5.0

func _process(_delta):
	var dir = Vector3.ZERO
	if Input.is_action_pressed("move_left"):
		dir += Vector3.LEFT
	elif Input.is_action_pressed("move_right"):
		dir += Vector3.RIGHT
	if Input.is_action_pressed("move_up"):
		dir += Vector3.FORWARD
	elif Input.is_action_pressed("move_down"):
		dir += Vector3.BACK
	
	if dir != Vector3():
		var cam_basis = get_viewport().get_camera().global_transform.basis
		var motion = Plane.PLANE_XZ.project(dir.x * cam_basis[0] + dir.z * cam_basis[2]).normalized()
		move_and_slide(motion * speed)
