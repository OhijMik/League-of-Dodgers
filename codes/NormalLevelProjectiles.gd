extends Node2D

var projectile = preload("res://scenes/small_projectile.tscn")
var curr_projectile = "small"
var proj_amt = 1

var champion

# Called when the node enters the scene tree for the first time.
func _ready():
	champion = get_node("../Champion")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if curr_projectile == "small":
		projectile = preload("res://scenes/small_projectile.tscn")
	elif curr_projectile == "medium":
		projectile = preload("res://scenes/medium_projectile.tscn")
	elif curr_projectile == "large":
		projectile = preload("res://scenes/large_projectile.tscn")
	elif curr_projectile == "falling":
		projectile = preload("res://scenes/falling_projectile.tscn")


func _on_projectile_spawn_timeout():
	var rng = RandomNumberGenerator.new()
	var randProj = rng.randi_range(0, 1)
	if randProj == 0:
		curr_projectile = "small"
		projectile = preload("res://scenes/small_projectile.tscn")
	else:
		curr_projectile = "medium"
		projectile = preload("res://scenes/medium_projectile.tscn")
	
	for i in range(proj_amt):
		var projectile_temp = projectile.instantiate()
		var randInt = rng.randi_range(0, 3)
		if randInt == 0:
			projectile_temp.position = Vector2(rng.randi_range(0, 1150), 0)
		elif randInt == 1:
			projectile_temp.position = Vector2(rng.randi_range(0, 1150), 650)
		elif randInt == 2:
			projectile_temp.position = Vector2(0, rng.randi_range(0, 650))
		else:
			projectile_temp.position = Vector2(1150, rng.randi_range(0, 650))
		
		projectile_temp.speed = 300
		projectile_temp.damage = 20
		
		add_child(projectile_temp)
