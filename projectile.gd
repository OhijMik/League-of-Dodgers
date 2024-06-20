extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var champion


func _ready():
	champion = get_node("../../Champion")
	var direction = (champion.position - position).normalized()
	velocity = direction * SPEED


func _physics_process(delta):
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "Champion" in body.name:
		body.hp -= 10
		queue_free()
