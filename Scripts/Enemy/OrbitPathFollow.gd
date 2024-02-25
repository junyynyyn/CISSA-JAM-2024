extends PathFollow2D

var MOVE_SPEED = 25.0

# Called when the node enters the scene tree for the first time.
func _ready():
	progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += delta * MOVE_SPEED
