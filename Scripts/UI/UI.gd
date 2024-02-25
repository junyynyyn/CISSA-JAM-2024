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
