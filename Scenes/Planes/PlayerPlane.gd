extends PathFollow2D

@export var SPEED: float = 100.0

func _physics_process(delta):
	progress += delta * SPEED

