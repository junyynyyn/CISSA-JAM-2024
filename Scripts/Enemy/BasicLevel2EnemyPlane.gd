extends EnemyPlane

var target: Vector2

func _ready():
	MAX_HEALTH = 2
	SPEED = 25
	DAMAGE = 1
	REWARD = 20
	health = MAX_HEALTH
	target = global.base.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(target)
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	
	move_and_slide()

func _on_attack_timer_timeout():
	fire(0)
