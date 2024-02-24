extends PlayerPlane

@onready var sprite := $Sprite2D
@export var TEXTURE: Texture2D

var bullet_scene = load("res://Scenes/PlayerBullet.tscn")
@onready var attack_timer = $AttackTimer

var LEVEL = {1: {"DAMAGE": 1.0, "ATTACK_SPEED": 1.0, "MOVE_SPEED": 100.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0008.png"},
2: {"DAMAGE": 3.0, "ATTACK_SPEED": 2.5, "MOVE_SPEED": 150.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0004.png"},
3: {"DAMAGE": 6.0, "ATTACK_SPEED": 4.0, "MOVE_SPEED": 200.0, "TEXTURE": "res://Sprites/kenney_pixel-shmup/Ships/ship_0000.png"}}

func _ready():
	sprite.texture = TEXTURE

func _physics_process(delta):
	progress += delta * MOVE_SPEED
	if attack_timer.is_stopped():
		attack_timer.start(1/ATTACK_SPEED)
		shoot_bullet()

func shoot_bullet():
	if ($TargetArea.get_overlapping_bodies()):
		var clone = bullet_scene.instantiate()
		var scene_root = get_tree().root.get_children()[0]
		scene_root.add_child(clone)

		clone.position = global_position
		var target = $TargetArea.get_overlapping_bodies()[0]
		clone.look_at(target.global_position)
		clone.DAMAGE = DAMAGE
	
