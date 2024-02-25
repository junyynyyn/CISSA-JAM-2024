extends HSlider

func _ready():
	pass

func _process(delta):
	if value != global.music_volume:
		value = global.music_volume

func _on_value_changed(value):
	global.music_volume = value
	$TestSFX.volume_db = value
	$TestSFX.play()
