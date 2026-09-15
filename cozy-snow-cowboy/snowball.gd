extends RigidBody2D
@onready var snowbody = $"."
@onready var snowball = $Snowball
@onready var snowballshape = $CollisionShape2D

func _ready() -> void:

	var scalex = randf()
	
	snowball.scale.x=scalex
	snowball.scale.y=scalex
	snowballshape.scale.x=scalex
	snowballshape.scale.y=scalex
	snowbody.mass=scalex*10
	#await get_tree().create_timer(2).timeout
	#if snowbody.linear_velocity.length_squared() > 0.001:
		#snowballshape.queue_free() 
