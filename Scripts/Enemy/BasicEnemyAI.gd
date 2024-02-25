extends EnemyPlane

var target: Vector2

func _ready():
	MAX_HEALTH = 2 * global.multiplier
	SPEED = 25
	DAMAGE = 5 * global.multiplier
	REWARD = 10
	health = MAX_HEALTH
	target = global.base.position
	
func _process(_delta):
	look_at(target)
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	
	move_and_slide()
