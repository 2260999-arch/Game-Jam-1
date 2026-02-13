extends Node3D

@export var platformmanager : Node3D
var new_platform = preload("res://Scenes/grass_platform.tscn")
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		print("1")
		var plat = new_platform.instantiate()
		plat.platformmanager = platformmanager
		platformmanager.add_child(plat)
		plat.global_position.z = global_position.z-95
		plat.global_position.y = global_position.y-45


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		queue_free()
