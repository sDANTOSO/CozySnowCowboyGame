extends TextureButton
var gamePaused=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(0,320), 2.0)


func _on_mouse_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(0,352), 2.0)


func _on_pressed() -> void:
	print ("roger roger")
	Input.action_release("Shoot")
	if gamePaused==false:
		pause()
		
	else: if gamePaused:
		unpause()
		
	

func pause():
	#print ("roger roger")
	
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(0,-60), 2.0)
	await get_tree().create_timer(2.0).timeout
	$"../PauseMenu".show()
	get_tree().paused = true
	gamePaused=true
func unpause():
	get_tree().paused=false
	$"../PauseMenu".hide()
	var tween = get_tree().create_tween()
	tween.tween_property($".", "position", Vector2(0,352), 2.0)
	
	gamePaused=false
