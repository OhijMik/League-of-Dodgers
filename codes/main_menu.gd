extends Node2D


func _on_custom_button_pressed():
	get_tree().change_scene_to_file("res://scenes/custom_game_scene.tscn")
	global.game_state = "custom"
	global.paused = true


func _on_quit_button_pressed():
	get_tree().quit()
