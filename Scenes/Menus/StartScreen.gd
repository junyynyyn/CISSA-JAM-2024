extends CanvasLayer

signal start_game

func _on_start_pressed():
	start_game.emit()


func _on_settings_pressed():
	$Start_Menu.hide()
	$Settings_Menu.show()


func _on_quit_pressed():
	get_tree().quit()


func _on_settings_quit_pressed():
	$Start_Menu.show()
	$Settings_Menu.hide()

