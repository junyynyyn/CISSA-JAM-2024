extends EnemyPlane

var target: Vector2
var bullet_scene = load("res://Scenes/EnemyPlanes/EnemyBullet.tscn")

func _ready():
	MAX_HEALTH = 2
	SPEED = 25
	DAMAGE = 5
	REWARD = 10
	health = MAX_HEALTH
	target = global.base.position
	
func _process(_delta):
	look_at(target)
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	
	move_and_slide()
