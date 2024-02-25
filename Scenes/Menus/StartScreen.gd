extends CanvasLayer

signal start_game

func _on_start_pressed():
	start_game.emit()

func _on_quit_pressed():
	get_tree().quit()
