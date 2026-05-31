extends Node2D

var gamePaused=false


	

#func _ready() -> void:
	#for scout in get_tree().get_nodes_in_group('Scouts'):
		#scout.connect('laserball',_on_scout_laserball)
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("pause") && gamePaused:
		#unpause()
		#gamePaused=false
	#if Input.is_action_just_pressed("pause") && gamePaused==false:
		#
		#pause()
		#gamePaused=true
		
func _on_pause_pressed() -> void:
	
	print("roger")
	if gamePaused==false:
		pause()
		gamePaused=true
	else: if gamePaused:
		
		unpause()
		gamePaused=false
	

func pause():
	print ("roger roger")
	$Control/PauseMenu.show()
	get_tree().paused = true
	
func unpause():
	$Control/PauseMenu.hide()
	get_tree().paused=false



		



func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.



	

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/theSnow.tscn")
