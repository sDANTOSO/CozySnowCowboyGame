extends Node2D


var laserball_scene = preload("res://Scenes/laserball.tscn")
var gamePaused=false 
#func _ready() -> void:
	#for scout in get_tree().get_nodes_in_group('Scouts'):
		#scout.connect('laserball',_on_scout_laserball)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") && gamePaused:
		unpause()
		gamePaused=false
	if Input.is_action_just_pressed("pause") && gamePaused==false:
		
		pause()
		gamePaused=true

func pause():
	get_tree().paused = true
	$PauseMenu.show()
	
	
func unpause():
	$PauseMenu.hide()
	get_tree().paused=false
	

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
		
