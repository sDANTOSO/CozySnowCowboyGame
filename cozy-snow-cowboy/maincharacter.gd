extends CharacterBody2D

@export var max_speed: int = 500
var speed: int = max_speed
const SPEED = 300.0
const JUMP_VELOCITY_STEP = 30

var jump_power_initial = -200
var jump_power = 0
var jump_time_max = 0.3
var jump_timer = 0.0
var is_jumping = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#func _ready():
	#_animated_sprite.play("default")
	

func _physics_process(delta):
	if not is_on_floor():
		velocity.y +=(gravity*3) * delta
	if is_on_floor():
		jump_timer = 0.0
		is_jumping = false
	else:
		jump_timer += delta
		
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_timer =0.0
		is_jumping = true
		apply_jump_force(jump_power_initial)
		jump_power = jump_power_initial
	elif Input.is_action_pressed("jump")&&  is_jumping && jump_timer< jump_time_max:
		jump_power -= JUMP_VELOCITY_STEP
		apply_jump_force(jump_power)
		
		
		
func _process(_delta: float) -> void:
	
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#if direction == (0.0, 1.0) or direction == (0.0, -1.0) :
		
	#else: if direction == "up":
		#velocity = direction * 200
		#
		#move_and_slide()
		
func apply_jump_force(power):
	velocity.y = power
	
func _input(event):
	if event.is_action_released("jump") && is_jumping:
		jump_timer=jump_time_max
