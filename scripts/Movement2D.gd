extends KinematicBody2D

export var speed := 300.0
export var sprite_path : NodePath
export var anim_tree_path: NodePath

onready var sprite = get_node(sprite_path)
onready var anim_tree = get_node(anim_tree_path)

var gaze = Vector2.RIGHT

func _physics_process(_delta):
	var dir = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		dir += Vector2.RIGHT
	elif Input.is_action_pressed("move_left"):
		dir += Vector2.LEFT

	if dir.x > 0:
		gaze = Vector2.RIGHT
	elif dir.x < 0:
		gaze = Vector2.LEFT
	
	if gaze == Vector2.RIGHT:
		sprite.scale = Vector2(1, 1)
	else:
		sprite.scale = Vector2(-1, 1)
	
	var zero_move = dir == Vector2()
	
	if !zero_move:
		move_and_slide(dir * speed)

	if anim_tree != null:
		anim_tree["parameters/conditions/walking"] = !zero_move
		anim_tree["parameters/conditions/idle"] = zero_move
		
