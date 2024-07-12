extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_retry_button_pressed():
	if global.game_state == "easy":
		get_tree().change_scene_to_file("res://scenes/easy_level_scene.tscn")
	elif global.game_state == "normal":
		get_tree().change_scene_to_file("res://scenes/normal_level_scene.tscn")
	elif global.game_state == "hard":
		get_tree().change_scene_to_file("res://scenes/hard_level_scene.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/teemo_level_scene.tscn")


func _on_main_menu_button_pressed():
	global.game_state = "main"
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
