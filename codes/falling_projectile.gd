extends CharacterBody2D


var damage = 25
var champion


func _ready():
	champion = get_node("../../Champion")


func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	if "Champion" in body.name:
		if global.game_state != "custom":
			body.hp -= damage
		queue_free()
