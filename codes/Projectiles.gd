extends Node2D

var projectile = preload("res://scenes/falling_projectile.tscn")
var curr_projectile = "falling"

var champion

# Called when the node enters the scene tree for the first time.
func _ready():
	champion = get_node("../Champion")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../UI/ProjectileSelection/SmallProjectile".hide()
	$"../UI/ProjectileSelection/MediumProjectile".hide()
	$"../UI/ProjectileSelection/LargeProjectile".hide()
	if curr_projectile == "small":
		$"../UI/ProjectileSelection/SmallProjectile".show()
		projectile = preload("res://scenes/small_projectile.tscn")
	elif curr_projectile == "medium":
		$"../UI/ProjectileSelection/MediumProjectile".show()
		projectile = preload("res://scenes/medium_projectile.tscn")
	elif curr_projectile == "large":
		$"../UI/ProjectileSelection/LargeProjectile".show()
		projectile = preload("res://scenes/large_projectile.tscn")
	elif curr_projectile == "falling":
		$"../UI/ProjectileSelection/LargeProjectile".show()
		projectile = preload("res://scenes/falling_projectile.tscn")

func _on_projectile_spawn_timeout():
	var projectile_temp = projectile.instantiate()
	if curr_projectile != "falling":
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
		projectile_temp.speed = $"../UI/ProjectileSpeed/SpeedSlider".value + 400
		add_child(projectile_temp)
	else:
		projectile_temp.position = champion.position
		add_child(projectile_temp)


func _on_right_button_pressed():
	if curr_projectile == "small":
		curr_projectile = "medium"
	elif curr_projectile == "medium":
		curr_projectile = "large"
	elif curr_projectile == "large":
		curr_projectile = "small"

func _on_left_button_pressed():
	if curr_projectile == "small":
		curr_projectile = "large"
	elif curr_projectile == "medium":
		curr_projectile = "small"
	elif curr_projectile == "large":
		curr_projectile = "medium"
