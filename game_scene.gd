extends Node2D

var cursor_click = preload("res://cursor_click.tscn")
@onready var champion = get_node("Champion")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move"):
		var mouse_pos = get_viewport().get_mouse_position()
		
		var cursor_click_temp = cursor_click.instantiate()
		cursor_click_temp.position = mouse_pos
		add_child(cursor_click_temp)


func _on_h_slider_value_changed(value):
	champion.change_size(value / 100)
