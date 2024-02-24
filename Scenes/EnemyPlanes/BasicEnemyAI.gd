extends EnemyPlane

var target: Vector2

func _ready():
	SPEED = 50
	DAMAGE = 10
	target = global.base.position
	
func _process(_delta):
	look_at(target)
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	
	move_and_slide()
