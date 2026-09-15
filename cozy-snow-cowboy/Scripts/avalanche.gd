extends Node2D
var snowball_scene = preload("res://snowball.tscn")
@onready var group: Node2D=$"."
signal avalanchestart(pos)
var avalanche_droppoints
var run = true;

func _on_timer_timeout() -> void:
		
		if run == true:
			#var laser = snowball_scene.instantiate()
			avalanche_droppoints = group.get_children()
			var coordinates = avalanche_droppoints[randi() % avalanche_droppoints.size()]
			avalanchestart.emit(coordinates.global_position)
			$"../Timer".start()

func _on_avalanchestart(pos) -> void:
	if run == true:
		create_snow(pos)
	
func create_snow(pos):
	if run == true:
		var snowball = snowball_scene.instantiate()
		snowball.position = pos
		print ("snowball")
		var snowball1 = snowball
		add_child(snowball)
	##$Snowballs.add_child(snowball)
	#snowball.add_to_group("Snowball")


func _on_unstable_avalanchestart() -> void:
	if run == true:
		avalanche_droppoints = group.get_children()
		var coordinates = avalanche_droppoints[randi() % avalanche_droppoints.size()]
		avalanchestart.emit(coordinates.global_position)
		$"../Timer".start()
		$"../Timer2".start()

func _on_timer_2_timeout() -> void:
	run= false;
	
