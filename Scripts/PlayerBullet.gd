extends StaticBody2D

const SPEED := 600.0

# Treat as const within this script. This will be changed outside of the script
# by whatever summoned a bullet
var DAMAGE: float

var hit_something = false

const KILL_TIME = 4.0
var timer = 0.0

func _physics_process(delta):
	timer += delta
	if timer >= KILL_TIME:
		queue_free()
	position += Vector2(1, 0).rotated(rotation) * SPEED * delta


func collided(body):
	if hit_something == false:
		if (body.is_in_group("enemy_plane")):
			body.damage(DAMAGE)
		pass
	hit_something = true
	queue_free()

