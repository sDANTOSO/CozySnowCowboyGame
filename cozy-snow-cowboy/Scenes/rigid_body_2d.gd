extends CharacterBody2D

@onready var capybara: AnimatedSprite2D =$AnimatedSprite2D
@onready var parent: Node2D =$"../.."
@onready var top: Sprite2D=$CryoTopHalf
@onready var bottom: Sprite2D=$CryoBottomHalf
@onready var timer: Timer= $Timer
@onready var timer2: Timer = $Timer2

@onready var target_path= get_parent().get_parent().get_node("Maincharacter/Ground2")
@export var follow_distance:float = 100.0
@export var follow_speed:float = 45.0
var target:Node2D
var followon =false


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
func _ready() -> void:
	capybara.play("default")
	target = target_path

func _physics_process(delta: float) -> void:
	if not target:
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if followon==true:
		
		
		var to_target = target.global_position - global_position
		var direction = to_target.normalized()
	
		if direction.x > 0 :
			capybara.flip_h=false
		elif direction.x <0:
			capybara.flip_h=true
	
		if to_target.length() > follow_distance:
			global_position += direction* follow_speed * delta 
			capybara.play("Walking")
		else:
			capybara.play("default")
		move_and_slide()
	
	
	
	
	
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	##if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	##var direction := Input.get_axis("ui_left", "ui_right")
	##if direction:
		##velocity.x = direction * SPEED
	##else:
	#
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()


func _on_capybara_boxdropped() -> void:
	timer.start()
	timer2.start()
	
	#followon=true
	#ondrop()
	
func ondrop()-> void:
	top.reparent(parent,true)
	top.rotation= 45
	#capybara.rotation = 55.0
	bottom.reparent(parent,true)


func _on_timer_timeout() -> void:
	followon =true
	ondrop()
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	capybara.rotation = 56
	
