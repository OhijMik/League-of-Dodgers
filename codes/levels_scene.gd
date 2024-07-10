extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_easy_button_pressed():
	get_tree().change_scene_to_file("res://scenes/easy_level_scene.tscn")
	global.game_state = "easy"


func _on_normal_button_pressed():
	get_tree().change_scene_to_file("res://scenes/normal_level_scene.tscn")
	global.game_state = "normal"


func _on_hard_button_pressed():
	get_tree().change_scene_to_file("res://scenes/hard_level_scene.tscn")
	global.game_state = "hard"
