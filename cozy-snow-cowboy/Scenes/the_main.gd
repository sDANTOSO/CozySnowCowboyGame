extends Node2D


var laserball_scene = preload("res://Scenes/laserball.tscn")
var marsh_scene = preload("res://MarshDrops.tscn")
var gamePaused=false 

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_onpress()

func _onpress():
	
	if gamePaused:
		unpause()
		
	elif gamePaused==false:
		
		pause()
		

func pause():
	
	
	$ControlsMenu.show()
	var tween = get_tree().create_tween()
	tween.tween_property($ControlsMenu, "position", Vector2(-14,-60), 2.0)
	await get_tree().create_timer(2.0).timeout
	$PauseMenu.show()
	get_tree().paused = true
	gamePaused=true
	
func unpause():
	#Input.action_release("pause")
	get_tree().paused=false
	$PauseMenu.hide()
	var tween = get_tree().create_tween()
	tween.tween_property($ControlsMenu, "position", Vector2(-14,500), 2.0)
	$ControlsMenu.hide()
	
	gamePaused=false

func _on_maincharacter_laser_shot(pos: Variant, direction: Variant) -> void:
	create_laser(pos,direction)
	
	pass # Replace with function body.
	
func create_laser(pos,direction):
		var laser = laserball_scene.instantiate()
		laser.position =pos
		laser.rotation_degrees = rad_to_deg(direction.angle())#+ 90
		laser.direction =direction
		var laser1= laser
		$Projectiles.add_child(laser)
		


func _on_main_tree_marshdropped(pos: Variant) -> void:
	create_marsh(pos)
	
	
func create_marsh(pos):
	var marsh = marsh_scene.instantiate()
	marsh.position = pos
	var marsh1 = marsh
	$Marshmallows.add_child(marsh)
	marsh.add_to_group("Marsh")
