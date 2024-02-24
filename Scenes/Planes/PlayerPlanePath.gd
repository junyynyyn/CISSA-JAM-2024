extends Path2D

# Size of circle path
const SIZE = 100
# Number of points to mimic circle
# More points -> smoother turning but might be more resource intensive
const NUM_POINTS = 50

func _ready():
	curve = Curve2D.new()
	for i in NUM_POINTS:
		curve.add_point(Vector2(0, -SIZE).rotated((i / float(NUM_POINTS)) * TAU))

	# End the circle.
	curve.add_point(Vector2(0, -SIZE))
