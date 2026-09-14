extends Node2D
var snowball_scene = preload("res://snowball.tscn")
@onready var group: Node2D=$"."
signal avalanchestart(pos)
var avalanche_droppoints
var run = true;
#func _ready() -> void:
	#$"../Timer".start()

func _on_timer_timeout() -> void:
		
		while run == true:
			#var laser = snowball_scene.instantiate()
			avalanche_droppoints = group.get_children()
			var coordinates = avalanche_droppoints[randi() % avalanche_droppoints.size()]
			avalanchestart.emit(coordinates.global_position)
		
		
		
	


func _on_avalanchestart(pos) -> void:
	create_snow(pos)
	#
func create_snow(pos):
	var snowball = snowball_scene.instantiate()
	snowball.position = pos
	var snowball1 = snowball
	add_child(snowball)
	##$Snowballs.add_child(snowball)
	#snowball.add_to_group("Snowball")


func _on_unstable_avalanchestart() -> void:
	avalanche_droppoints = group.get_children()
	var coordinates = avalanche_droppoints[randi() % avalanche_droppoints.size()]
	avalanchestart.emit(coordinates.global_position)
	$"../Timer".start()
	$"../Timer2".start()

func _on_timer_2_timeout() -> void:
	run= false;
	
