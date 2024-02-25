extends Area2D

@export var SPEED := 400.0

var DAMAGE: float

const KILL_TIME = 4.0
var timer = 0.0

func _physics_process(delta):
	timer += delta
	if timer >= KILL_TIME:
		queue_free()
	position += Vector2(1, 0).rotated(rotation) * SPEED * delta

func collided(area):
	if (area.is_in_group("player_base") or area.is_in_group("movable_shield")):
		queue_free()
