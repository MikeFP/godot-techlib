extends VisualInstance

export var trigger_collider_path: NodePath
onready var trigger_collider = get_node(trigger_collider_path)
onready var ray : RayCast = $RayCast

var obstructions = []

func _ready():
	ray.offset = Vector3()
	ray.target = get_viewport().get_camera()
	_register()

func _register():
	yield(get_tree(), "idle_frame")
	SpatialMaskController.register_mask(self)

func _physics_process(_delta):
	ray.cast_to = ray.to_local(trigger_collider.global_transform.origin)
	ray.force_raycast_update()
	var last_size = obstructions.size()
	obstructions = get_all_ray_colliders(ray)

func get_all_ray_colliders(raycast: RayCast):
	var res = []
	while raycast.is_colliding():
		var col = raycast.get_collider()
		res.append(col)
		raycast.add_exception(col)
		raycast.force_raycast_update()
	for col in res:
		raycast.remove_exception(col)
	return res
