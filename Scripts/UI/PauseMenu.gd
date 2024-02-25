extends Control

func _ready():
	hide()


func _process(delta):
	if get_tree().paused:
		show()
	else:
		hide()


func _on_resume_button_pressed():
	get_tree().paused = false


func _on_exit_button_pressed():
	get_tree().quit()


func _input(_event):
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
