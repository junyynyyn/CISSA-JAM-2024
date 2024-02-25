extends Node2D

@export var MAX_HEALTH = 1000
var hp
var money
var hp_wave = 0.0 # Amount of HP to heal after each wave.
var mouse_overlap = false

var LEVEL = {1: {"MAX_HEALTH": 800.0, "HP_WAVE": 50.0, "UPGRADE_PRICE": 600, "PLACEABLE_RADIUS": 180, "PLACEMENT_SCALE": 1.5},\
2: {"MAX_HEALTH": 1000.0, "HP_WAVE": 100.0, "UPGRADE_PRICE": 1000, "PLACEABLE_RADIUS": 300, "PLACEMENT_SCALE": 2.5},\
3: {"MAX_HEALTH": 1200.0, "HP_WAVE": 150.0, "UPGRADE_PRICE": 1600, "PLACEABLE_RADIUS": 400, "PLACEMENT_SCALE": 3.3},\
4: {"MAX_HEALTH": 1600.0, "HP_WAVE": 200.0, "UPGRADE_PRICE": 2400, "PLACEABLE_RADIUS": 500, "PLACEMENT_SCALE": 4.2}}
var base_level = 1

func _ready():
	global.base = self
	hp = MAX_HEALTH
	%HealthBar.max_value = MAX_HEALTH
	%HealthBar.value = hp
	
	$UpgradePrice.hide()
	
func _process(_delta):
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
		body.queue_free()

func _on_enemy_planes_wave_clear():
	hp += hp_wave
	hp = clamp(hp, 0, MAX_HEALTH)

func set_price_label(level):
	if LEVEL.has(level):
		if global.money < LEVEL[level]["UPGRADE_PRICE"]:
			$UpgradePrice.add_theme_color_override("font_color", Color(1, 0, 0))
		else:
			if $UpgradePrice.has_theme_color_override("font_color"):
				$UpgradePrice.remove_theme_color_override("font_color")
		$UpgradePrice.text = "$" + str(LEVEL[level]["UPGRADE_PRICE"])
		$UpgradePrice.show()
	else:
		$UpgradePrice.hide()

func _on_hitbox_mouse_entered():
	mouse_overlap = true
	await get_tree().create_timer(0.5).timeout
	if mouse_overlap:
		set_price_label(base_level)

func _on_hitbox_mouse_exited():
	mouse_overlap = false
	$UpgradePrice.hide()

func _input(_event):
	if Input.is_action_just_pressed("place"):
		if mouse_overlap:
			if global.money >= LEVEL[base_level]["UPGRADE_PRICE"]:
				global.money -= LEVEL[base_level]["UPGRADE_PRICE"]
				base_level += 1
				set_price_label(base_level)
				upgrade_base(base_level)

func upgrade_base(level):
	MAX_HEALTH = LEVEL[level]["MAX_HEALTH"]
	hp += LEVEL[level]["MAX_HEALTH"]
	hp -= LEVEL[level-1]["MAX_HEALTH"]
	hp_wave = LEVEL[level]["HP_WAVE"]
	%HealthBar.max_value = MAX_HEALTH
	%HealthBar.value = hp
	%PlacementCircle.shape.radius = LEVEL[level]["PLACEABLE_RADIUS"]
	%PlacementSprite.scale = Vector2(LEVEL[level]["PLACEMENT_SCALE"], LEVEL[level]["PLACEMENT_SCALE"])


