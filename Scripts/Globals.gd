extends Node

var mouse
var plane_selector
var base

var wave
var score
var money
var multiplier

var music_volume = 0

var selected_plane = 0

func _ready():
	wave = 1
	score = 0
	money = 500
	multiplier = 1.0

