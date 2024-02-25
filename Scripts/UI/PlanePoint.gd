extends Marker2D

const MAX_LEVEL = 3

var UPGRADE_PRICE = {"Blue1": 300, "Blue2": 400,\
"Red1": 350, "Red2": 500,\
"Green1": 350, "Green2": 600,\
"Yellow1": 400, "Yellow2": 750}

var plane_colour = "Blue"
var plane_level = 1

var mouse_overlap = false

func _ready():
	$UpgradePrice.hide()


func _process(_delta):
	pass


func set_label():
	if UPGRADE_PRICE.has(plane_colour + str(plane_level)):
		$UpgradePrice.text = "$" + str(UPGRADE_PRICE[plane_colour + str(plane_level)])
		$UpgradePrice.show()
		if global.money < UPGRADE_PRICE[plane_colour + str(plane_level)]:
			$UpgradePrice.add_theme_color_override("font_color", Color(1, 0, 0))
	else:
		$UpgradePrice.hide()
		if $UpgradePrice.has_theme_color_override("font_color"):
			$UpgradePrice.remove_theme_color_override("font_color")


func _on_area_2d_mouse_entered():
	mouse_overlap = true
	await get_tree().create_timer(0.5).timeout
	if mouse_overlap:
		set_label()


func _on_area_2d_mouse_exited():
	mouse_overlap = false
	$UpgradePrice.hide()


func _input(_event):
	if Input.is_action_pressed("place") and mouse_overlap:
		if UPGRADE_PRICE.has(plane_colour + str(plane_level)):
			if global.money >= UPGRADE_PRICE[plane_colour + str(plane_level)]:
				global.money -= UPGRADE_PRICE[plane_colour + str(plane_level)]
				plane_level += 1
				set_label()
				var plane_node = get_parent().get_child(get_parent().get_children().find(self) - 1).get_child(0)
				plane_node.DAMAGE = plane_node.LEVEL[plane_level]["DAMAGE"]
				plane_node.ATTACK_SPEED = plane_node.LEVEL[plane_level]["ATTACK_SPEED"]
				plane_node.MOVE_SPEED = plane_node.LEVEL[plane_level]["MOVE_SPEED"]
				plane_node.sprite.texture = load(plane_node.LEVEL[plane_level]["TEXTURE"])
				plane_node.sprite.scale *= 1.5
				if plane_colour == "Red":
					plane_node.BULLET_COUNT = plane_node.LEVEL[plane_level]["BULLET_COUNT"]
				if plane_colour == "Yellow":
					plane_node.upgrade_range(plane_level)
