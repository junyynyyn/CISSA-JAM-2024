extends Area2D

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


func collided(area):
	#if hit_something == false:
		#for areas in $Area2D.get_overlapping_area():
			#if (areas.is_in_group("player_base")):
				#area.damage(DAMAGE)
	if (area.is_in_group("player_base") or area.is_in_group("base_shield")):
		hit_something = true
	$AnimatedSprite2D.play("hit")

func _on_animation_finished():
	queue_free()
