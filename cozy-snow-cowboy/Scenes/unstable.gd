extends RigidBody2D
@onready var branch: RigidBody2D =$"."
var hey = false

func _ready() -> void:
	add_to_group("branch")
	
	
func hit () -> void:
	
	hey=true
	branch.gravity_scale=1.0
	
func _physics_process(_delta: float) -> void:
	if (hey == true ):
		print()
		#branch.gravity_scale = 2
