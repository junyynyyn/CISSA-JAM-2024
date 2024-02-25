extends CanvasLayer

var game_scene = "res://Scenes/GameArea.tscn"

func _ready():
	print("Test")

func _on_try_again_pressed():
	print("Test")
	get_tree().change_scene_to_file(game_scene)

func _on_quit_pressed():
	get_tree().quit()

func set_values(waves, score):
	$Waves.text = "Waves Reached: " + str(waves)
	$Score.text = "Score: " + str(score)
