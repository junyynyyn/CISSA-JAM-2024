extends CanvasLayer

func _ready():
	update_money()
	
func _process(delta):
	update_money()
	
func update_money():
	$Money.text = "$" + str(global.money)
