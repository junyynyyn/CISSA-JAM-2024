extends Camera2D

@export var MOUSE_SENSITIVITY : float = 0.5
var dragging = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		dragging = true
	else:
		dragging = false

func _unhandled_input(event: InputEvent) -> void:
	if (event is InputEventMouseMotion and dragging):
		var move_x = -event.relative.x * MOUSE_SENSITIVITY
		var move_y = -event.relative.y * MOUSE_SENSITIVITY
		position += Vector2(move_x, move_y)
