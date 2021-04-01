extends KinematicBody2D

export var speed := 300.0

func _physics_process(_delta):
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		dir += Vector2.RIGHT
	elif Input.is_action_pressed("move_left"):
		dir += Vector2.LEFT
	
	if dir != Vector2():
		move_and_slide(dir * speed)
