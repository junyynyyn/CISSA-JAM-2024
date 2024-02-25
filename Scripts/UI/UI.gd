extends CanvasLayer

func _ready():
	update_money()
	
func _process(delta):
	update_money()
	update_score()
	update_wave()

func update_wave():
	$WaveLabel.text = "Wave: " + str(global.wave)

func update_score():
	$ScoreLabel.text = "Score: " + str(global.score)

func update_money():
	$Money.text = "$" + str(global.money)


func _on_speed_button_1x_pressed():
	Engine.time_scale = 1.0

func _on_speed_button_2x_pressed():
	Engine.time_scale = 2.0
