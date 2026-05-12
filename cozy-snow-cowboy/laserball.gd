extends Area2D

signal hit_breakable
@export var speed:int =300
var direction: Vector2= Vector2.UP

func _ready() -> void:
	$Laserdie.start()
	add_to_group("projectile")
	
func _process(delta: float) -> void:
	position += direction * speed * delta
	

func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("branch"):
		#hit_breakable.emit()
	#else: 
	if "hit" in body:
		body.hit()
		queue_free()
		pass # Replace with function body.


func _on_laserdie_timeout() -> void:
	#print("yay")
	queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if "hit" in body:
		body.hit()
		print("hitS")
		queue_free()
	 # Replace with function body.
