extends Node2D

var blue_plane = load("res://Scenes/Planes/PlayerPlane.tscn")
var point = load("res://Scenes/PlanePoint.tscn")

func _process(delta):
	if (Input.is_action_just_pressed("place") and global.mouse.placeable and !global.mouse.intersecting):
		match global.selected_plane:
			"BluePlaneButton":
				if (global.money >= 100):
					var plane_instance = blue_plane.instantiate()
					plane_instance.position = get_global_mouse_position()
					add_child(plane_instance)
					
					var plane_marker = point.instantiate()
					plane_marker.position = get_global_mouse_position()
					add_child(plane_marker)
					
					global.money -= 100
			"RedPlaneButton":
				if (global.money >= 200):
					print("Spawning red plane")
		
		global.plane_selector.reset()
		global.selected_plane = ""
		
	if (Input.is_action_just_pressed("cancel")):
		global.plane_selector.reset()
		global.selected_plane = ""
