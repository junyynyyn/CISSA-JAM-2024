extends PathFollow2D

@export var SPEED: float = 100.0
@export var DAMAGE: float
@export var ATTACK_SPEED: float
@export var TEXTURE

func _physics_process(delta):
	progress += delta * SPEED

