extends Node2D

@onready var bullet_shield = $BulletShield
@onready var bomb_shield = $BombShield

# Distance from base
var dist:= 200.0
# Change this to global coordinates of base in main scene
var center = Vector2(200,200)

func _ready():
	pass

func _process(delta):
	# Change this key
	if Input.is_action_pressed("down"):
		bomb_shield.show()
		bullet_shield.hide()
		bomb_shield.position = center
	else:
		bullet_shield.show()
		bomb_shield.hide()
		var dir = center.direction_to(get_viewport().get_mouse_position())
		bullet_shield.position = center + dir * dist
		var ang = deg_to_rad(90)+(bullet_shield.position-center).angle()
		bullet_shield.rotation = ang
