extends PlayerPlane

@onready var sprite := $Sprite2D
@export var TEXTURE: Texture2D

var bullet_scene = load("res://Scenes/PlayerBullet.tscn")
@onready var attack_timer = $AttackTimer

var LEVEL = {1: {"DAMAGE": 3.0, "ATTACK_SPEED": 0.25, "MOVE_SPEED": 50.0, "RANGE": 200.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0011.png"},
2: {"DAMAGE": 5.5, "ATTACK_SPEED": 0.5, "MOVE_SPEED": 75.0, "RANGE": 400.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0007.png"},
3: {"DAMAGE": 9.0, "ATTACK_SPEED": 0.75, "MOVE_SPEED": 100.0, "RANGE": 600.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0003.png"}}

const BULLET_SPEED = 2000.0
const RANGE_Y = 100.0  # How wide the cone for detection is. 100.0 -> 200 pixels wide

func _ready():
	sprite.texture = TEXTURE

func _physics_process(delta):
	progress += delta * MOVE_SPEED
	if ($TargetArea.get_overlapping_bodies()):
		if attack_timer.is_stopped():
			attack_timer.start(1/ATTACK_SPEED)
			shoot_bullet()

func shoot_bullet():
	var clone = bullet_scene.instantiate()
	var scene_root = get_tree().root.get_child(0)
	scene_root.add_child(clone)

	clone.position = global_position
	var target = $TargetArea.get_overlapping_bodies()[0]
	clone.look_at(target.global_position)
	clone.DAMAGE = DAMAGE
	clone.SPEED = BULLET_SPEED


func upgrade_range(level):
	if LEVEL.has(level):
		$TargetArea/CollisionPolygon2D.polygon = PackedVector2Array([Vector2(0, 0), Vector2(LEVEL[level]["RANGE"], RANGE_Y), Vector2(LEVEL[level]["RANGE"], -RANGE_Y)])
