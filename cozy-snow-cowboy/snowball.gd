extends RigidBody2D
@onready var snowbody = $"."
@onready var snowball = $Snowball
@onready var snowballshape = $CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(snowballshape.scale.x)
	print(snowballshape.scale.y)

	var scalex = randf()
	
	snowball.scale.x=scalex
	snowball.scale.y=scalex
	snowballshape.scale.x=scalex
	snowballshape.scale.y=scalex
	snowbody.mass=scalex*10
	#snowbody.gravity_scale= scalex*20
	await get_tree().create_timer(0.8).timeout
	if snowbody.linear_velocity.length_squared() > 0.001:
		snowballshape.queue_free() 
