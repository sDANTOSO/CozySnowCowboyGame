extends StaticBody2D

signal player_entered_cave
#signal player_exited_gate

func _on_area_2d_body_entered(_body: Node2D) -> void:
	player_entered_cave.emit()
	pass # Replace with function body.



#func _on_area_2d_body_exited(_body: Node2D) -> void:
	#player_exited_gate.emit()
	#pass # Replace with function body.


func _on_player_entered_cave() -> void:
	pass # Replace with function body.
