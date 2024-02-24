extends Area2D

var placeable = false
var intersecting = false

func _ready():
	global.mouse = self

func _process(delta):
	position = get_global_mouse_position()
	for area in get_overlapping_areas():
		if (area.is_in_group("placement_area")):
			placeable = true
		elif (area.is_in_group("intersect_area")):
			intersecting = true

func _on_area_exited(area):
	if (area.is_in_group("placement_area")):
		placeable = false
	elif (area.is_in_group("intersect_area")):
		intersecting = false

