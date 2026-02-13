extends Area3D

@export var boost_speed = 50
var actively_boosting = false
var thing = RigidBody3D
func _ready() -> void:
	pass # Replace with function body.

func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D:
		actively_boosting = true
		thing = body

func _on_body_exited(body: Node3D) -> void:
	actively_boosting = false

func _physics_process(delta: float) -> void:
	if actively_boosting:
		thing.apply_force(Vector3(0,0,-boost_speed))
