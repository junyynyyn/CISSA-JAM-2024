class_name EnemyPlane
extends CharacterBody2D

var MAX_HEALTH
var DAMAGE
var SPEED

var health

signal defeated

func damage(damage: int):
	print("Hit!")
	health -= damage
	if (health <= 0):
		die()

func die():
	defeated.emit()
	queue_free()
