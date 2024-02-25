extends Node

var mouse
var plane_selector
var base

var wave
var score
var money

var selected_plane = 0

func _ready():
	wave = 1
	score = 0
	money = 1000

func _input(event):
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("cancel"):
		get_tree().paused = !get_tree().paused
