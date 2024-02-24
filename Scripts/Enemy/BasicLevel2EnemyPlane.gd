extends EnemyPlane

var target: Vector2
var bullet_scene = load("res://Scenes/EnemyPlanes/EnemyBullet.tscn")

func _ready():
	MAX_HEALTH = 2
	SPEED = 25
	DAMAGE = 1
	REWARD = 20
	health = MAX_HEALTH
	target = global.base.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(target)
	var direction = (target - position).normalized()
	velocity = direction * SPEED
	
	move_and_slide()

func fire():
	var bullet = bullet_scene.instantiate()
	var scene_root = get_tree().root
	scene_root.add_child(bullet)
	
	bullet.position = global_position
	bullet.rotation = rotation
	bullet.DAMAGE = DAMAGE

func _on_attack_timer_timeout():
	fire()
