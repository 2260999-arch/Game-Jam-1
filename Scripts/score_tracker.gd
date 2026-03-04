extends Control

@onready var time_left: Label = $TimeLeft
@onready var score: Label = $Score
@export var total = Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = str(PlayerManager.score)
