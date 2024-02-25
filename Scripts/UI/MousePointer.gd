extends Area2D

var placing = false
var placeable = false
var intersecting = false

func _ready():
	global.mouse = self

func _process(_delta):
	position = get_global_mouse_position()
	for area in get_overlapping_areas():
		if (area.is_in_group("placement_area")):
			placeable = true
		elif (area.is_in_group("intersect_area")):
			intersecting = true
			
			
	if placing:
		$PlaceIndicator.visible = true
	else:
		$PlaceIndicator.visible = false
		
	if (not placeable or intersecting):
		$PlaceIndicator.modulate = Color(1,0,0)
	else:
		$PlaceIndicator.modulate = Color(1,1,1)

func _on_area_exited(area):
	if (area.is_in_group("placement_area")):
		placeable = false
	elif (area.is_in_group("intersect_area")):
		intersecting = false

