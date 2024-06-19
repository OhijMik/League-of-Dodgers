extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction
	if Input.is_action_just_pressed("move"):
		direction = get_viewport().get_mouse_position().normalized()
		
	if direction:
		velocity = direction * SPEED
	#else:
		#velocity = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
