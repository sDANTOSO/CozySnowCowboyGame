extends Node2D

signal boxdropped

func hit () -> void:
	boxdropped.emit() # this signals to the capybaras rigid body to start the actions when the box drops
