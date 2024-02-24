extends Node2D

var wave_ongoing = true

func _ready():
	start_wave()

func _process(delta):
	pass
	
func start_wave():
	$EnemyPlanes.spawn_wave(global.wave)

func _on_enemy_planes_wave_clear():
	global.wave += 1
	start_wave()
