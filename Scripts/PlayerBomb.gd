extends StaticBody2D

const SPEED := 150.0

# Treat as const within this script. This will be changed outside of the script
# by whatever summoned a bullet
var DAMAGE: float

var hit_something = false

const KILL_TIME = 15.0
var timer = 0.0

func _physics_process(delta):
	timer += delta
	if timer >= KILL_TIME:
		queue_free()
	if !hit_something:
		position += Vector2(1, 0).rotated(rotation) * SPEED * delta


func collided(body):
	if hit_something == false:
		for bodies in $Area2D.get_overlapping_bodies():
			if (bodies.is_in_group("enemy_plane")):
				bodies.damage(DAMAGE)
	hit_something = true
	$AnimatedSprite2D.play("hit")


func _on_animation_finished():
	queue_free()
