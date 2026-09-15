extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	

func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(173,88), 2.0)

func _on_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(173,-11), 2.0)
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scenes/theSnow.tscn")
	
func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(173,125), 2.0)
	
