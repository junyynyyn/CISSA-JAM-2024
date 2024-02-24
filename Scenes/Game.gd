extends Node2D

var wave_ongoing = true
var enemies_left = 0

func _process(delta):
	if enemies_left == 0:
		start_wave()
	
func start_wave():
	$EnemyPlanes.spawn_wave(5)
	enemies_left = 5

func _on_enemy_planes_plane_defeated():
	enemies_left -= 1
