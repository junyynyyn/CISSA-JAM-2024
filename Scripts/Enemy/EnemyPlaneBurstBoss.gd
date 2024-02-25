extends EnemyPlane

var path
var orbit_distance = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	MAX_HEALTH = 50 * global.multiplier
	SPEED = 50
	DAMAGE = 1 * global.multiplier
	REWARD = 100
	health = MAX_HEALTH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var target = path.pathpoint.global_position
	var direction = (target - position).normalized()
	look_at(target)
	velocity = direction * SPEED
	move_and_slide()

func die():
	defeated.emit()
	global.money += REWARD
	path.queue_free()
	queue_free()

func _on_attack_timer_timeout():
	fire(0.25)
	fire(0)
	fire(0.25)
	await get_tree().create_timer(0.1).timeout
	fire(0.25)
	fire(0)
	fire(0.25)
	await get_tree().create_timer(0.1).timeout
	fire(0.25)
	fire(0)
	fire(0.25)
