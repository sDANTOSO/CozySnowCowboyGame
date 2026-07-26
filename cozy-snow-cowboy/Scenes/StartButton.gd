extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(158,88), 2.0)
	pass # Replace with function body.


func _on_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(158,-11), 2.0)
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scenes/theSnow.tscn")
	pass # Replace with function body.


func _on_area_2d_mouse_entered() -> void:
	
	pass # Replace with function body.
