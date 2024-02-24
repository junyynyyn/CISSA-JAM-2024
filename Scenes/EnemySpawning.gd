extends Node2D

var basic_plane = load("res://Scenes/EnemyPlanes/BasicEnemyPlane.tscn")

signal plane_defeated

func spawn_wave(wave):
	for i in wave:
		%SpawnPoint.progress_ratio = randf()
		var plane = basic_plane.instantiate()
		plane.global_position = %SpawnPoint.global_position
		add_child(plane)
		plane.connect("defeated", _plane_defeated)
		
func _plane_defeated():
	plane_defeated.emit()
