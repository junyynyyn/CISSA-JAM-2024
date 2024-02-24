extends PlayerPlane

@onready var sprite := $Sprite2D
@export var TEXTURE: Texture2D

var bullet_scene = load("res://Scenes/PlayerBullet.tscn")
@onready var attack_timer = $AttackTimer

var LEVEL_1 = {"DAMAGE": 1.0, "ATTACK_SPEED": 2.0, "MOVE_SPEED": 100.0}
var LEVEL_2 = {"DAMAGE": 3.0, "ATTACK_SPEED": 4.0, "MOVE_SPEED": 150.0}
var LEVEL_3 = {"DAMAGE": 6.0, "ATTACK_SPEED": 8.0, "MOVE_SPEED": 200.0}

func _ready():
	sprite.texture = TEXTURE

func _physics_process(delta):
	progress += delta * MOVE_SPEED
	if attack_timer.is_stopped():
		attack_timer.start(1/ATTACK_SPEED)
		shoot_bullet()

func shoot_bullet():
	var clone = bullet_scene.instantiate()
	var scene_root = get_tree().root.get_children()[0]
	scene_root.add_child(clone)
	
	clone.position = global_position
	clone.rotation = rotation
	clone.DAMAGE = DAMAGE
	
