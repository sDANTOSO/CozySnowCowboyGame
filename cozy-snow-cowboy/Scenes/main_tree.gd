extends StaticBody2D

@onready var timer: Timer= $Timer
@onready var group: Node2D=$"../Marsh Starting Points"

signal marshdropped(pos)

var spawnamount= 14
var marsh_spawns
var branch_fell= false

func _ready() -> void:
	timer.start()
	
func hit () -> void:
	branch_fell=true
	

func _on_timer_timeout() -> void:
	marsh_spawns = group.get_children()
	
	if branch_fell==true:
		print("branch is broken")
		spawnamount= marsh_spawns.size
	
	var selected_laser = marsh_spawns[randi() % marsh_spawns.size()]
	marshdropped.emit(selected_laser.global_position)
	
	timer.start()
	pass # Replace with function body.
