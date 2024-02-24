extends Node2D

var plane_maker = load("res://Scenes/PlanePoint.tscn")

func _process(delta):
	if (Input.is_action_just_pressed("place (temp)")):
		var point = plane_maker.instantiate()
		point.position = get_global_mouse_position()
		add_child(point)
