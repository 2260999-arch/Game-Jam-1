extends Node3D

@onready var num_gen = RandomNumberGenerator.new()
@onready var platform_manager := PlatformManager
@onready var p1 = load("res://Scenes/grass_platform.tscn")
@onready var p2 = load("res://Scenes/grass_platform_jump.tscn")
@onready var p3 = load("res://Scenes/grass_platform_speed_boost.tscn")
@onready var p4 = load("res://Scenes/grass_platform_oppenents.tscn")
@onready var p5 = load("res://Scenes/grass_platform_cube_obstacles.tscn")
@onready var platforms : Array = [p1, p2, p3, p4, p5]
@onready var next_lvl = 0
@onready var new_platform = load("res://Scenes/grass_platform.tscn")
var plat
func _ready() -> void:
	#Engine.time_scale = 5
	print('created '+str(name))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		print("func")
		next_num()
		print(next_lvl)
		new_platform=platforms[next_lvl]
		plat = new_platform.instantiate()
		#plat.platform_manager = PlatformManager
		PlatformManager.add_child(plat)
		
		
		plat.global_position.z = global_position.z-95
		plat.global_position.y = global_position.y-45


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body is Player:
		queue_free()

func next_num() -> void:
	next_lvl = num_gen.randi_range(0,4)
	

# ends game when you fall off the edge
func _on_area_3d_2_body_entered(body: Node3D) -> void:
	if body is Player:
		for child in PlatformManager.get_children():
			child.queue_free()
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
