extends RigidBody3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D
@onready var camera_3d: Camera3D = $Camera3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera_3d.top_level = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	camera_3d.global_position.y = global_position.y+2
	camera_3d.global_position.z = global_position.z+2
	camera_3d.global_position.x = global_position.x
	camera_3d.look_at(mesh_instance_3d.global_position)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Move_Left"):
		apply_force(Vector3i(-5,0,0))
	if Input.is_action_pressed("Move_Right"):
		apply_force(Vector3i(5,0,0))
