extends TextureButton
var gamePaused=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(-83,320), 2.0)


func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(-83,352), 2.0)


func _on_pressed() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(-83,270), 2.0)
	await get_tree().create_timer(2.0).timeout
	if gamePaused==false:
		pause()
		gamePaused=true
	else: if gamePaused:
		
		unpause()
		gamePaused=false
	

func pause():
	print ("roger roger")
	$"../PauseMenu".show()
	get_tree().paused = true
	
func unpause():
	$"../PauseMenu".hide()
	get_tree().paused=false
