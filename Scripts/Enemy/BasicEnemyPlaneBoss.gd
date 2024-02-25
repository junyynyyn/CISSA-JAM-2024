extends EnemyPlane

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	MAX_HEALTH = 40 * global.multiplier
	SPEED = 25
	DAMAGE = 2 * global.multiplier
	REWARD = 200
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
