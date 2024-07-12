extends CharacterBody2D


var speed = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction
var mouse_pos
var hp = 100

@onready var health_bar = get_node("HpBar/HealthBar")
@onready var health_text = get_node("HpBar/HealthText")
@onready var hit_anim = get_node("HitAnimationPlayer")
@onready var run_anim = get_node("RunAnimationPlayer")


func _ready():
	run_anim.play("run")


func _process(delta):
	health_text.text = str(hp)
	health_bar.size.x = 97 * (hp/100.0)
	
	if hp < 55:
		$HpBar/HealthText.add_theme_color_override("font_color", Color(255, 255, 255, 1))
	
	if hp <= 0:
		hit_anim.play("death")
		$CollisionShape2D.set_disabled(true)
		if not $DeathSound.playing:
			$DeathSound.play()
		global.paused = true


func _physics_process(delta):
	if not global.paused:
		if Input.is_action_just_pressed("move"):
			mouse_pos = get_viewport().get_mouse_position()
			direction = (mouse_pos - position).normalized()
		
		if direction:
			if position.x > mouse_pos.x - 10 and position.x < mouse_pos.x + 10 \
		   		and position.y > mouse_pos.y - 10 and position.y < mouse_pos.y + 10:
				velocity = Vector2.ZERO
				direction = null
			else:
				velocity = direction * speed
		else:
			velocity = Vector2.ZERO

		move_and_slide()


func change_size(size):
	scale = Vector2(size, size)


func hit(damage):
	hit_anim.play("hit")
	if global.game_state != "custom":
		hp -= damage


func _on_hit_animation_player_animation_finished(anim_name):
	if anim_name == "death":
		get_tree().change_scene_to_file("res://scenes/death_scene.tscn")
