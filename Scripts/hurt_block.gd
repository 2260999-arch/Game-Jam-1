extends Node3D




func _on_detect_player_body_entered(body: Node3D) -> void:
	if body is Player:
		for child in PlatformManager.get_children():
			child.queue_free()
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
