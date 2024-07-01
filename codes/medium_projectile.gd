extends CharacterBody2D


var speed = 600.0

var damage = 20
var champion


func _ready():
	champion = get_node("../../Champion")
	var direction = (champion.position - position).normalized()
	velocity = direction * speed
	look_at(champion.position)


func _physics_process(delta):
	if not global.paused:
		if position.x < -50 or position.x > 1200 or position.y < -50 or position.y > 700:
			queue_free()
		move_and_slide()


func _on_area_2d_body_entered(body):
	if "Champion" in body.name:
		body.hit(damage)
		queue_free()
