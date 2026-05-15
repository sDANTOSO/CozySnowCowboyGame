extends Node2D
@onready var box: RigidBody2D=$RigidBody2D
@onready var top: Sprite2D=$RigidBody2D/CryoTopHalf
@onready var bottom: Sprite2D=$RigidBody2D/CryoBottomHalf

var hey= false


func _ready() -> void:
	add_to_group("branch")
	
func hit () -> void:
	hey=true
	box.gravity_scale=0.3
	#bottom.rotation = 45
	top.rotation= 90
	
func _physics_process(_delta: float) -> void:
	if (hey == true ):
		box.gravity_scale = 1.0
