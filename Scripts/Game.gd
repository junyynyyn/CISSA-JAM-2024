extends Node2D

var wave_ongoing = false
var continous_waves = false

func _ready():
	get_tree().paused = true
	Engine.time_scale = 1.0
	$BG_Music.play()

func _process(_delta):
	if global.base.hp <= 0:
		$DeathScreen.set_values(global.wave,global.score)
		$DeathScreen.visible = true
		get_tree().paused = true


func start_wave():
	$EnemyPlanes.spawn_wave(global.wave)
	wave_ongoing = true

func _on_enemy_planes_wave_clear():
	global.wave += 1
	wave_ongoing = false
	if (continous_waves):
		start_wave()

func _on_texture_button_button_down():
	get_tree().paused = false
	$UI.visible = true
	$HomeBase.visible = true
	$MousePointer.visible = true
	$StartScreen.visible = false

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

func _on_manual_button_pressed():
	get_tree().paused = !get_tree().paused
	$UI/ManualUI.visible = get_tree().paused
	
