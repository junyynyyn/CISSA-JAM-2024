extends EnemyPlane

var path

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_scene = load("res://Scenes/EnemyPlanes/EnemyBomb.tscn")
	MAX_HEALTH = 9
	SPEED = 25
	DAMAGE = 10
	REWARD = 40
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
	fire(0)
