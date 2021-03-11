extends Spatial

export var target_path: NodePath
export var offset := Vector3()
export(float, 0, 1) var smoothness := 0.125

onready var target = get_node(target_path)

func _ready():
	if target != null:
		offset = - target.global_transform.origin + global_transform.origin

func _physics_process(_delta):
	if target != null:
		var pos = lerp(global_transform.origin, target.global_transform.origin + offset, smoothness)
		global_transform.origin = pos
