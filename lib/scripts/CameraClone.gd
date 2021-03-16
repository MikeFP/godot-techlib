extends Camera
tool

export var camera_path: NodePath
onready var camera = get_node(camera_path)

func _ready():
	fov = camera.fov

func _process(_delta):
	global_transform = camera.global_transform
