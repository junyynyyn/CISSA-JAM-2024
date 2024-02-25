extends Node2D

var wave_ongoing = true

func _ready():
	get_tree().paused = true
	start_wave()

func _process(delta):
	if global.base.hp <= 0:
		get_tree().reload_current_scene()
	
func start_wave():
	$EnemyPlanes.spawn_wave(global.wave)

func _on_enemy_planes_wave_clear():
	global.wave += 1
	start_wave()

func _on_texture_button_button_down():
	get_tree().paused = false
	$UI.visible = true
	$HomeBase.visible = true
	$MousePointer.visible = true
	$PlayMenu.visible = false
