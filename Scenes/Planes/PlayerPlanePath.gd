extends Path2D

# Size of circle path
const SIZE = 100.0
# Number of points to mimic circle
# More points -> smoother turning but might be more resource intensive
const NUM_POINTS = 50

var circle_curve = Curve2D.new()
#var eight_curve = Curve2D.new()
var infinity_curve = Curve2D.new()

func _ready():
	# Set up circle curve
	for i in NUM_POINTS:
		circle_curve.add_point(Vector2(-SIZE, 0).rotated((i / float(NUM_POINTS)) * TAU))
	# End the circle.
	circle_curve.add_point(Vector2(-SIZE, 0))
	
	for i in NUM_POINTS:
		if i <= NUM_POINTS * 0.25:
			infinity_curve.add_point(Vector2(-SIZE/2, 0).rotated((i/float(NUM_POINTS)) * 2 * TAU) - Vector2(SIZE/2, 0))
		elif i <= NUM_POINTS * 0.5:
			infinity_curve.add_point(Vector2(-SIZE/2, 0).rotated(deg_to_rad(540) - (i/float(NUM_POINTS)) * 2 * TAU) + Vector2(SIZE/2, 0))
		elif i<= NUM_POINTS * 0.75:
			infinity_curve.add_point(Vector2(-SIZE/2, 0).rotated(deg_to_rad(180) - (i/float(NUM_POINTS)) * 2 * TAU) + Vector2(SIZE/2, 0))
		else:
			infinity_curve.add_point(Vector2(-SIZE/2, 0).rotated((i/float(NUM_POINTS)) * 2 * TAU) - Vector2(SIZE/2, 0))
	infinity_curve.add_point(Vector2(-SIZE, 0))
		
	# Change starting curve here
	curve = infinity_curve
