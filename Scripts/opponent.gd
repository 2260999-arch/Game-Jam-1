extends RigidBody3D

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func rand_num() -> float:
	var rand = randf_range(0.0,1.0)
	return rand

func get_color() -> Color:
	var color = Color(rand_num(),rand_num(),rand_num(), 1.0)
	return color

func _ready() -> void:
	var mat = mesh_instance_3d.get_active_material(0).duplicate()
	mat.albedo_color = get_color()
	mesh_instance_3d.set_surface_override_material(0, mat)
	print(mat.albedo_color)
