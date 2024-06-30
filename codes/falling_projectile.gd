extends CharacterBody2D


var damage = 25
var champion
@onready var anim = get_node("InitialAnimationPlayer")


func _ready():
	champion = get_node("../../Champion")
	anim.play("fire")


func _physics_process(delta):
	pass


func _on_area_2d_body_entered(body):
	if "Champion" in body.name:
		if global.game_state != "custom":
			body.hp -= damage
		queue_free()


func _on_animation_player_animation_finished(anim_name):
	pass # Replace with function body.
