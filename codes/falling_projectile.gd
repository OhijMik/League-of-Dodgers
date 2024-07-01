extends CharacterBody2D


var damage = 25
var champion
var falling = false
@onready var anim = get_node("AnimationPlayer")


func _ready():
	champion = get_node("../../Champion")
	anim.play("fire")


func _process(delta):
	var overlapping_body = $Area2D.get_overlapping_bodies()
	if not overlapping_body.is_empty() and "Champion" in overlapping_body[0].name and falling:
		overlapping_body[0].hit(damage)
		falling = false


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fire":
		anim.play("Falling")
		falling = true
	elif anim_name == "Falling":
		queue_free()
