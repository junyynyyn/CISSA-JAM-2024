extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	global.plane_selector = self
	for button in get_children():
		button.pressed.connect(_on_button_pressed.bind(button))

func _on_button_pressed(button):
	global.mouse.placing = true
	global.selected_plane = button.name

func reset():
	for button in get_children():
		button.button_pressed = false
