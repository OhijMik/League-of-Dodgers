extends Node2D

var cursor_click = preload("res://scenes/cursor_click.tscn")

var champion
var projectile_spawn_timer
var ui
var curr_projectile

# Called when the node enters the scene tree for the first time.
func _ready():
	champion = get_node("Champion")
	projectile_spawn_timer = get_node("ProjectileSpawn")
	ui = get_node("UI")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move") and not global.paused:
		var mouse_pos = get_viewport().get_mouse_position()
		
		var cursor_click_temp = cursor_click.instantiate()
		cursor_click_temp.position = mouse_pos
		add_child(cursor_click_temp)
	
	if Input.is_action_just_pressed("escape") and not $StartButton.visible:
		if global.paused:
			global.paused = false
			ui.hide()
			$ResumeButton.hide()
			projectile_spawn_timer.set_paused(false)
		else:
			global.paused = true
			ui.show()
			$ResumeButton.show()
			projectile_spawn_timer.set_paused(true)
	
	$UI/ProjectileFrequency/FrequencyLabel.text = str(projectile_spawn_timer.wait_time)


func _on_h_slider_value_changed(value):
	champion.change_size(value / 100)


func _on_speed_slider_value_changed(value):
	champion.speed = value + 150.0


func _on_plus_button_pressed():
	projectile_spawn_timer.wait_time += 0.05


func _on_minus_button_pressed():
	projectile_spawn_timer.wait_time -= 0.05


func _on_start_button_pressed():
	global.paused = false
	$StartButton.hide()
	ui.hide()
	projectile_spawn_timer.start()


func _on_back_button_pressed():
	global.game_state = "main"
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_resume_button_pressed():
	global.paused = false
	ui.hide()
	$ResumeButton.hide()
	projectile_spawn_timer.set_paused(false)


func _on_reset_button_pressed():
	projectile_spawn_timer.wait_time = 2.0
	$UI/ChampionSpeed/SpeedSlider.value = 150
	$UI/ChampionHitboxSize/HitboxSlider.value = 100
	$UI/ProjectileSpeed/SpeedSlider.value = 200
