extends RigidBody2D

@onready var branch: RigidBody2D =$"."

var hey = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("projectile"):
		
		
		
		print("yay")
	pass # Replace with function body.
	
	
func _process(_delta: float) -> void:
	if (hey == true ):
		gravity_scale = 1.0
		
