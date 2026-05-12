extends RigidBody2D

@onready var branch: RigidBody2D =$"."

var hey = false

func _ready() -> void:
	add_to_group("branch")
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("projectile"):
		
		hey=true
		branch.gravity_scale=1.0
		print("yay")
	pass # Replace with function body.
	
	
func _physics_process(_delta: float) -> void:
	if (hey == true ):
		branch.gravity_scale = 1.0
		
		
