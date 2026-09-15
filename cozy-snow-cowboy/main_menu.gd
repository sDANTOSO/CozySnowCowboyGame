extends Node2D

var gamePaused=false

func _on_pause_pressed() -> void:
	if gamePaused==false:
		pause()
		gamePaused=true
	else: if gamePaused:
		unpause()
		gamePaused=false
	

func pause():
	$Control/PauseMenu.show()
	get_tree().paused = true
	
func unpause():
	$Control/PauseMenu.hide()
	get_tree().paused=false
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/theSnow.tscn")
