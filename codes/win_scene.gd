extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_menu_button_pressed():
	global.game_state = "main"
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


func _on_background_sound_finished():
	$BackgroundSound.play()
