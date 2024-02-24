extends Node2D

@export var MAX_HEALTH = 200
var hp
var money

func _ready():
	global.base = self
	hp = MAX_HEALTH
	%HealthBar.max_value = MAX_HEALTH
	%HealthBar.value = hp
	
func _process(delta):
	pass
	
func damage(dmg: int):
	hp -= dmg
	%HealthBar.value = hp

func _on_hitbox_area_entered(area):
	if (area.is_in_group("enemy_projectile")):
		damage(area.DAMAGE)

func _on_hitbox_body_entered(body):
	if (body.is_in_group("enemy_projectile")):
		damage(body.DAMAGE)
		body.die()
