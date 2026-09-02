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



func _on_capybara_boxdropped() -> void:
	timer.start() #starts timer that opens crate and starts following player
	timer2.start() #starts timer that rotates capybara


func _on_timer_timeout() -> void:
	followon =true #sets capybara to follow player
	ondrop() # calls cryobox changes that occur when the branch drops


func _on_timer_2_timeout() -> void:
	capybara.rotation = 56 #sets capybara rotation to be the same as the ground

func ondrop()-> void:
	top.reparent(parent,true)#reparents the top to the tree so its location is fixed
	top.rotation= 45#rotates the cryobox top so it looks as if its opened
	bottom.reparent(parent,true)#reparents the bottom to the tree so its location is fixed
