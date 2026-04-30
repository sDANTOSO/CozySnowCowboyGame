extends CharacterBody2D

@onready var sprite : Sprite2D= $Sprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction1:Vector2=Vector2.ZERO


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	direction1 = Input.get_vector("left", "right","up","down")
	if direction :
		velocity.x = direction * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_facing_direction()
	
func update_facing_direction():
	if direction1.x > 0:
		sprite.flip_h=false
	elif direction1.x <0:
		sprite.flip_h=true
	
