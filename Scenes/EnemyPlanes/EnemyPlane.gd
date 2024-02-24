class_name EnemyPlane
extends CharacterBody2D

var MAX_HEALTH
var DAMAGE
var SPEED

var health

signal defeated

func die():
	defeated.emit()
	queue_free()
