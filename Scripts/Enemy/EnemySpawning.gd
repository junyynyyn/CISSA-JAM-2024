extends Node2D

var orbit_path = load("res://Scenes/EnemyPlanes/OrbitPath.tscn")

var basic_plane = load("res://Scenes/EnemyPlanes/BasicEnemyPlane.tscn")
var basic_plane_2 = load("res://Scenes/EnemyPlanes/BasicLevel2EnemyPlane.tscn")
var basic_plane_boss = load("res://Scenes/EnemyPlanes/BasicEnemyPlaneBoss.tscn")

var plane_burst = load("res://Scenes/EnemyPlanes/EnemyPlaneBurst.tscn")
var plane_burst_2 = load("res://Scenes/EnemyPlanes/Level2EnemyPlaneBurst.tscn")
var plane_burst_boss = load("res://Scenes/EnemyPlanes/EnemyPlaneBurstBoss.tscn")

var plane_bomb = load("res://Scenes/EnemyPlanes/EnemyPlaneBomb.tscn")
var plane_bomb_2 = load("res://Scenes/EnemyPlanes/EnemyPlaneBomb2.tscn")
var plane_bomb_boss = load("res://Scenes/EnemyPlanes/EnemyPlaneBombBoss.tscn")

signal wave_clear
var wave_ongoing = false

func spawn_wave(wave):
	wave_ongoing = true
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
	# Spawn burst firers from round 10+
	if (wave > 10):
		for i in roundi((wave/5 - 1)):
			%SpawnPoint.progress_ratio = randf()
			var plane = plane_burst.instantiate()
			plane.global_position = %SpawnPoint.global_position
			
			var orbit = orbit_path.instantiate()
			orbit.position = global.base.global_position
			
			plane.path = orbit
			
			add_child(orbit)
			add_child(plane)
			
			orbit.set_speed(plane.SPEED)
		for i in roundi((wave/5 - 2)):
			%SpawnPoint.progress_ratio = randf()
			var plane = plane_burst_2.instantiate()
			plane.global_position = %SpawnPoint.global_position
			
			var orbit = orbit_path.instantiate()
			orbit.position = global.base.global_position
			
			plane.path = orbit
			
			add_child(orbit)
			add_child(plane)
			
			orbit.set_speed(plane.SPEED)
			
	# Bomber spawns at wave 20+
	if (wave > 20):
		for i in roundi((wave/10 - 2)):
			%SpawnPoint.progress_ratio = randf()
			var plane = plane_bomb.instantiate()
			plane.global_position = %SpawnPoint.global_position
			
			var orbit = orbit_path.instantiate()
			orbit.position = global.base.global_position
			
			plane.path = orbit
			
			add_child(orbit)
			add_child(plane)
			
			orbit.set_speed(plane.SPEED)
			orbit.set_size(200)
		for i in roundi((wave/10 - 3)):
			%SpawnPoint.progress_ratio = randf()
			var plane = plane_bomb_2.instantiate()
			plane.global_position = %SpawnPoint.global_position
			
			var orbit = orbit_path.instantiate()
			orbit.position = global.base.global_position
			
			plane.path = orbit
			
			add_child(orbit)
			add_child(plane)
			
			orbit.set_speed(plane.SPEED)
			orbit.set_size(200)
	# Spawn bosses logic
	if (wave % 30 == 0):
		%SpawnPoint.progress_ratio = randf()
		var plane = plane_bomb_boss.instantiate()
		plane.global_position = %SpawnPoint.global_position
			
		var orbit = orbit_path.instantiate()
		orbit.position = global.base.global_position
			
		plane.path = orbit
			
		add_child(orbit)
		add_child(plane)
			
		orbit.set_speed(plane.SPEED)
		orbit.set_size(250)
	elif (wave % 20 == 0):
		%SpawnPoint.progress_ratio = randf()
		var plane = plane_burst_boss.instantiate()
		plane.global_position = %SpawnPoint.global_position
		
		var orbit = orbit_path.instantiate()
		orbit.position = global.base.global_position
			
		plane.path = orbit
			
		add_child(orbit)
		add_child(plane)
			
		orbit.set_speed(plane.SPEED)
	elif (wave % 10 == 0):
		%SpawnPoint.progress_ratio = randf()
		var plane = basic_plane_boss.instantiate()
		plane.global_position = %SpawnPoint.global_position
		add_child(plane)

func _process(delta):
	if (wave_ongoing and get_child_count() == 1):
		wave_ongoing = false
		wave_clear.emit()
		
