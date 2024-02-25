extends Node2D

var wave_ongoing = false
var continous_waves = false

func _ready():
	get_tree().paused = true
	Engine.time_scale = 1.0
	$BG_Music.play()

func _process(delta):
	if global.base.hp <= 0:
		get_tree().reload_current_scene()
	
func start_wave():
	$EnemyPlanes.spawn_wave(global.wave)
	wave_ongoing = true

func _on_enemy_planes_wave_clear():
	print("Wave " + str(global.wave) + "Clear")
	global.wave += 1
	wave_ongoing = false
	if (continous_waves):
		print("spawning wave")
		start_wave()

func _on_texture_button_button_down():
	get_tree().paused = false
	$UI.visible = true
	$HomeBase.visible = true
	$MousePointer.visible = true
	$PlayMenu.visible = false

func _on_next_wave_pressed():
	if (not wave_ongoing):
		start_wave()
	else:
		continous_waves = !continous_waves
		$UI.continous(continous_waves)

func _on_bg_music_finished():
	$BG_Music.play()

func _on_fast_forward_pressed():
	if (Engine.time_scale <= 2.0):
		Engine.time_scale *= 2.0
	else:
		Engine.time_scale = 1.0
	$UI.set_time_scale(Engine.time_scale)
