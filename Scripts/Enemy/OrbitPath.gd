extends Path2D

var SIZE = 150.0
@onready var pathpoint = %OrbitPathFollow
# Number of points to mimic circle
# More points -> smoother turning but might be more resource intensive
const NUM_POINTS = 50

var circle_curve = Curve2D.new()
#var eight_curve = Curve2D.new()
var infinity_curve = Curve2D.new()

func _ready():
	# Set up circle curve
	set_size(SIZE)

func set_size(size):
	SIZE = size
	for i in NUM_POINTS:
		circle_curve.add_point(Vector2(-SIZE, 0).rotated((i / float(NUM_POINTS)) * TAU))
	# End the circle.
	circle_curve.add_point(Vector2(-SIZE, 0))
	curve = circle_curve
	
func set_speed(speed):
	%OrbitPathFollow.MOVE_SPEED = speed
