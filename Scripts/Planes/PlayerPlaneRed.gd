extends PlayerPlane

@onready var sprite := $Sprite2D
@export var TEXTURE: Texture2D

var bullet_scene = load("res://Scenes/PlayerBullet.tscn")
@onready var attack_timer = $AttackTimer

var LEVEL_1 = {"DAMAGE": 1.0, "ATTACK_SPEED": 0.5, "MOVE_SPEED": 75.0, "BULLET_COUNT": 4}
var LEVEL_2 = {"DAMAGE": 2.5, "ATTACK_SPEED": 1.0, "MOVE_SPEED": 100.0, "BULLET_COUNT": 6}
var LEVEL_3 = {"DAMAGE": 5.0, "ATTACK_SPEED": 1.5, "MOVE_SPEED": 125.0, "BULLET_COUNT": 8}
var BULLET_COUNT = 0

func _ready():
	sprite.texture = TEXTURE

func _physics_process(delta):
	progress += delta * MOVE_SPEED
	if attack_timer.is_stopped():
		attack_timer.start(1/ATTACK_SPEED)
		shoot_bullet()

func shoot_bullet():
	if ($TargetArea.has_overlapping_bodies()):
		look_at($TargetArea.get_overlapping_bodies()[0].position)
	for i in range(BULLET_COUNT):
		var clone = bullet_scene.instantiate()
		var scene_root = get_tree().root.get_children()[0]
		scene_root.add_child(clone)
		
		clone.position = global_position
		clone.rotation = rotation + i/float(BULLET_COUNT) * TAU
		clone.DAMAGE = DAMAGE
	