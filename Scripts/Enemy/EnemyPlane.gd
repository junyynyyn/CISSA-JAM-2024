class_name EnemyPlane
extends CharacterBody2D

var MAX_HEALTH
var DAMAGE
var SPEED
var REWARD

var health

signal defeated

func damage(dmg: int):
	print("Hit!")
	health -= dmg
	if (health <= 0):
		die()

func die():
	defeated.emit()
	global.money += REWARD
	queue_free()
