extends Node2D

var hp
var money

func _ready():
	global.base = self
	hp = 50
	money = 200
	
func _process(delta):
	pass

func _on_hitbox_area_entered(area):
	if (area.is_in_group("enemy_projectile")):
		hp -= area.damage
		area.queue_free()

func _on_hitbox_body_entered(body):
	if (body.is_in_group("enemy_projectile")):
		hp -= body.DAMAGE
		body.die()
