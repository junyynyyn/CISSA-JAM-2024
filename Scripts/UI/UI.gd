extends CanvasLayer

var FFTexture = "res://Sprites/kenney_ui-pack/PNG/green_sliderDown.png"
var StopTexture = "res://Sprites/kenney_ui-pack/PNG/red_sliderDown.png"

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
	
func set_time_scale(scale):
	$FastForward/Label.text = "x" + str(scale)
	
func continous(value):
	$"NextWave/Continous Waves".text = "Continous Waves: " + str(value).capitalize()
