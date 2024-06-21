extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var direction
var mouse_pos
var hp = 100

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
			velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func change_size(size):
	scale = Vector2(size, size)
