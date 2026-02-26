extends Control

@onready var score_label: Label = $ScoreLabel
@onready var highscore_label: Label = $HighscoreLabel




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score_label.text = "SCORE: " + str(PlayerManager.score)
	highscore_label.text = "HIGHSCORE: " + str(PlayerManager.highscore)
	pass


func _on_restart_pressed() -> void:
	PlayerManager.score = 0
	get_tree().change_scene_to_file("res://Scenes/test_level.tscn")
	
