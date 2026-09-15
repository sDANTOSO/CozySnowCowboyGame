extends Area2D

@export var speed:int =300
var direction: Vector2= Vector2.DOWN

func _ready() -> void:
	$Laserdie.start()
	add_to_group("projectile")
	
func _process(delta: float) -> void:
	position += direction * speed * delta
	

func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("branch"):
		body.hit()
	if body.is_in_group("enemy"):
		body.hit()
		
	if "hit" in body:
		body.hit()
		queue_free()
		pass # Replace with function body.


func _on_laserdie_timeout() -> void:
	queue_free() # makes sure laser doesn't get drawn forever creating potential lag


func _on_area_2d_body_entered(_body: Node2D) -> void:
	queue_free() #makes sure it doesn't phase through 2d bodies visually
