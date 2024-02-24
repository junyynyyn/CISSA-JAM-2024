extends Area2D

const SPEED := 600.0

var DAMAGE: float = 5

const KILL_TIME = 4.0
var timer = 0.0

func _physics_process(delta):
	timer += delta
	if timer >= KILL_TIME:
		queue_free()
	position += Vector2(1, 0).rotated(rotation) * SPEED * delta


func collided(area):
	queue_free()
