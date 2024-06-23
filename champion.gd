extends CharacterBody2D


var speed = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction
var mouse_pos
var hp = 100

@onready var health_bar = get_node("HpBar/HealthBar")
@onready var health_text = get_node("HpBar/HealthText")


func _process(delta):
	health_text.text = str(hp)
	health_bar.size.x = 97 * (hp/100.0)


func _physics_process(delta):
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
