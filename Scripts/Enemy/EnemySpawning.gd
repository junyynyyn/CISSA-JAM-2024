extends Node2D

var basic_plane = load("res://Scenes/EnemyPlanes/BasicEnemyPlane.tscn")
var basic_plane_2 = load("res://Scenes/EnemyPlanes/BasicLevel2EnemyPlane.tscn")
var basic_plane_boss = load("res://Scenes/EnemyPlanes/BasicEnemyPlaneBoss.tscn")

signal wave_clear

func spawn_wave(wave):
	for i in wave:
		%SpawnPoint.progress_ratio = randf()
		var plane = basic_plane.instantiate()
		plane.global_position = %SpawnPoint.global_position
		add_child(plane)
	# Start spawning shooters from wave 5
	if (wave >= 5):
		for i in roundi(wave / 5):
			%SpawnPoint.progress_ratio = randf()
			var plane = basic_plane_2.instantiate()
			plane.global_position = %SpawnPoint.global_position
			add_child(plane)
	# Spawn bosses at wave 10
	if (wave % 10 == 0):
		%SpawnPoint.progress_ratio = randf()
		var plane = basic_plane_boss.instantiate()
		plane.global_position = %SpawnPoint.global_position
		add_child(plane)

func _process(delta):
	if (get_child_count() == 1):
		wave_clear.emit()
