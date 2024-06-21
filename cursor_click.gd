extends Node2D

@onready var anim_player = get_node("AnimationPlayer")

# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.play("clicked")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	queue_free()
