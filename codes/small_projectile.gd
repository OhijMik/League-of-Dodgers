extends CharacterBody2D


const SPEED = 650.0

var damage = 50
var champion


func _ready():
	champion = get_node("../../Champion")
	var direction = (champion.position - position).normalized()
	velocity = direction * SPEED
	look_at(champion.position)


func _physics_process(delta):
	if not global.paused:
		if position.x < -50 or position.x > 1200 or position.y < -50 or position.y > 700:
			queue_free()
		move_and_slide()


func _on_area_2d_body_entered(body):
	if "Champion" in body.name:
		if global.game_state != "custom":
			body.hp -= damage
		queue_free()
