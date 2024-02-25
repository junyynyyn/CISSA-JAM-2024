class_name EnemyPlane
extends CharacterBody2D

var MAX_HEALTH
var DAMAGE
var SPEED
var REWARD

var health

var bullet_scene = load("res://Scenes/EnemyPlanes/EnemyBullet.tscn")

signal defeated

func damage(damage: int):
	health -= damage
	if (health <= 0):
		die()
		
func fire(angle):
	var bullet = bullet_scene.instantiate()
	var scene_root = get_tree().root
	scene_root.add_child(bullet)
	
	bullet.position = global_position
	bullet.look_at(global.base.global_position)
	bullet.rotation += angle
	bullet.DAMAGE = DAMAGE

func die():
	defeated.emit()
	global.money += REWARD
	queue_free()
