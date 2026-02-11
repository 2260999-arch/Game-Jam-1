extends Area3D


@export var jump_speed = 100
var actively_jumping = false
var thing = RigidBody3D
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		actively_jumping = true
		thing = body


func _on_body_exited(body: Node3D) -> void:
	actively_jumping = false

func _physics_process(delta: float) -> void:
	if actively_jumping:
		thing.apply_force(Vector3(0,jump_speed,0))
	
