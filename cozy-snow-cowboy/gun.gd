extends RigidBody2D


func _ready() -> void:
	add_to_group("Weapon")
	add_to_group("Grabbable")
func kill() -> void:
	queue_free()
