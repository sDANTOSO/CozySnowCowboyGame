extends Node2D
@onready var box: RigidBody2D=$RigidBody2D
var hey= false

func hit () -> void:
	hey=true
	box.gravity_scale=0.3
	
func _physics_process(_delta: float) -> void:
	if (hey == true ):
		box.gravity_scale = 1.0
