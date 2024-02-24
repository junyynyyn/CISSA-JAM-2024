extends Node2D

var blue_plane = load("res://Scenes/Planes/PlayerPlaneBlue.tscn")
var red_plane = load("res://Scenes/Planes/PlayerPlaneRed.tscn")
var green_plane = load("res://Scenes/Planes/PlayerPlaneGreen.tscn")
var point = load("res://Scenes/UI/PlanePoint.tscn")

func _process(delta):
	if (Input.is_action_just_pressed("place") and global.mouse.placeable and !global.mouse.intersecting):
		match global.selected_plane:
			"BluePlaneButton":
				if (global.money >= 100):
					place_plane(blue_plane, 1, 100)
			"RedPlaneButton":
				if (global.money >= 200):
					place_plane(red_plane, 1, 200)
			"GreenPlaneButton":
				if (global.money >= 200):
					place_plane(green_plane, 1, 200)
		
		global.plane_selector.reset()
		global.selected_plane = ""
		global.mouse.placing = false
		
	if (Input.is_action_just_pressed("cancel")):
		global.plane_selector.reset()
		global.selected_plane = ""
		global.mouse.placing = false

func place_plane(scene, level, cost):
	var plane_instance = scene.instantiate()
	plane_instance.position = get_global_mouse_position()
	add_child(plane_instance)
	
	var plane_stat = plane_instance.get_children()[0]
	var lvl = plane_stat.LEVEL[1]
	
	plane_stat.DAMAGE = lvl["DAMAGE"]
	plane_stat.ATTACK_SPEED = lvl["ATTACK_SPEED"]
	plane_stat.MOVE_SPEED = lvl["MOVE_SPEED"]
	if scene == red_plane:
		plane_stat.BULLET_COUNT = lvl["BULLET_COUNT"]
	
	var plane_marker = point.instantiate()
	plane_marker.position = get_global_mouse_position()
	add_child(plane_marker)
	plane_marker.plane_level = level
	plane_marker.plane_colour = global.selected_plane.get_slice("PlaneButton", 0)
	
	global.money -= cost
