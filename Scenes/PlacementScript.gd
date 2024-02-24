extends Node2D

var blue_plane = load("res://Scenes/Planes/PlayerPlaneBlue.tscn")
var point = load("res://Scenes/PlanePoint.tscn")

func _process(delta):
	if (Input.is_action_just_pressed("place") and global.mouse.placeable and !global.mouse.intersecting):
		match global.selected_plane:
			"BluePlaneButton":
				if (global.money >= 100):
					place_plane(blue_plane, 1, 100)
			"RedPlaneButton":
				if (global.money >= 200):
					print("Spawning red plane")
		
		global.plane_selector.reset()
		global.selected_plane = ""
		
	if (Input.is_action_just_pressed("cancel")):
		global.plane_selector.reset()
		global.selected_plane = ""

func place_plane(scene, level, cost):
	var plane_instance = scene.instantiate()
	plane_instance.position = get_global_mouse_position()
	add_child(plane_instance)
	
	var lvl
	var plane_stat = plane_instance.get_children()[0]
	match level:
		1:
			lvl = plane_stat.LEVEL_1
		2:
			lvl = plane_stat.LEVEL_2
		3:
			lvl = plane_stat.LEVEL_3
	plane_stat.DAMAGE = lvl["DAMAGE"]
	plane_stat.ATTACK_SPEED = lvl["ATTACK_SPEED"]
	plane_stat.MOVE_SPEED = lvl["MOVE_SPEED"]
	
	var plane_marker = point.instantiate()
	plane_marker.position = get_global_mouse_position()
	add_child(plane_marker)
	
	global.money -= cost
