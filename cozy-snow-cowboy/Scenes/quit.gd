extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(752,350), 2.0)

func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(752,379), 2.0)


func _on_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(752,280), 2.0)
	await get_tree().create_timer(2.0).timeout
	get_tree().quit()
