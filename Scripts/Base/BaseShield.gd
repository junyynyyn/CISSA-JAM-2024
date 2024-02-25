extends Node2D

@onready var bullet_shield = $BulletShield
@onready var bomb_shield = $BombShield

# Distance from base
var dist:= 80.0
var center

func _ready():
	center = get_parent().position

func _process(_delta):
	# Change this key
	if Input.is_action_pressed("down"):
		bomb_shield.show()
		bullet_shield.hide()
		bomb_shield.monitorable = true
		bomb_shield.position = Vector2(0, 0)
	else:
		bullet_shield.show()
		bomb_shield.hide()
		bomb_shield.monitorable = false
		var dir = center.direction_to(get_global_mouse_position())
		bullet_shield.position = dir * dist
		var ang = deg_to_rad(90)+(bullet_shield.position).angle()
		bullet_shield.rotation = ang
