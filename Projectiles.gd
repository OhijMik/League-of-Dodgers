extends Node2D

var projectile = preload("res://projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_projectile_spawn_timeout():
	var projectile_temp = projectile.instantiate()
	var rng = RandomNumberGenerator.new()
	var randInt = rng.randi_range(0, 3)
	if randInt == 0:
		projectile_temp.position = Vector2(rng.randi_range(0, 1150), 0)
	elif randInt == 1:
		projectile_temp.position = Vector2(rng.randi_range(0, 1150), 650)
	elif randInt == 2:
		projectile_temp.position = Vector2(0, rng.randi_range(0, 650))
	else:
		projectile_temp.position = Vector2(1150, rng.randi_range(0, 650))
	add_child(projectile_temp)
