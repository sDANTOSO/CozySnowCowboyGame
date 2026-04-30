extends Node2D


func _on_area_2d_body_entered(_body: Node2D) -> void:
	
	ProjectSettings.set_setting("physics/2d/default_gravity", 1)
	print("yes")
	pass # Replace with function body.


func _on_area_2d_body_exited(_body: Node2D) -> void:
	ProjectSettings.set_setting("physics/2d/default_gravity", 50)
	pass # Replace with function body.
