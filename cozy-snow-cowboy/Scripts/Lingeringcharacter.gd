extends CharacterBody2D

@onready var sprite : AnimatedSprite2D= $CharacterSprite
@onready var collision_shape_2d: CollisionShape2D =$PlayerCollision
@onready var marker1: Marker2D =$Marker2D
@onready var marker2: Marker2D =$Marker2D2
@onready var  currentmarker: Marker2D=$Marker2D
@onready var playerzone: Area2D=$Area2D

signal laser_shot(pos,direction)#says where the laser is being shot so that the scene can create the laser 

const SPEED = 300.0
const JUMP_VELOCITY = -300.0

var direction1:Vector2=Vector2.ZERO
var can_laser: bool = true #changes if laser has cooled down
var inUse = true #if this characters in use for movement
var weaponout=false
var inzone = false
var bodyinzone
var canroast=false
var toasting=false
var currentani  = "default"

func _ready() -> void:
	add_to_group("player")
	sprite.play("default")
	#print(sprite.h)

func _physics_process(delta: float) -> void:
	collision_shape_2d.disabled = not inUse#disables collison if we dont control the player
	
	if not inUse:
		sprite.play("default")
		currentani ="default"
		return
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
	
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("Grab") && inzone == true:
		bodyinzone.kill()
		canroast=true
	
	if Input.is_action_just_pressed("roast") &&canroast ==true && toasting == false:
		sprite.play("Toasting")
		toasting=true
		currentani ="default"
	else: if Input.is_action_just_pressed("roast")&&canroast ==true && toasting == true:
		sprite.play("default")
		currentani ="default"
		toasting=false
	
	if Input.is_action_just_pressed("drawweapon") && weaponout == false:
		sprite.play("Shoot") 
		currentani ="Shoot"
		weaponout=true
	else: if Input.is_action_just_pressed("drawweapon") && weaponout == true:
		sprite.play("default")
		weaponout=false
		
	#var animation_state = get animation_state()
	
	if currentani != "Shoot":
			weaponout=false
		
		
	if Input.is_action_just_pressed("Shoot") && weaponout==true && can_laser== true:
		$Lasercooldown.start()
		var start_point = currentmarker
		var player_direction=(get_global_mouse_position()-position).normalized()
		laser_shot.emit(start_point.global_position,player_direction)
		can_laser=false
	
func update_facing_direction()  :
	if direction1.x > 0 :
		sprite.flip_h=false
		currentmarker=marker1
	elif direction1.x <0:
		sprite.flip_h=true
		currentmarker=marker2




func _on_lasercooldown_timeout() -> void:
	can_laser=true
	pass # Replace with function body.



func _on_fourmyle_player_dont_flip_h() -> void:
	sprite.flip_h=false
	pass # Replace with function body.


func _on_fourmyle_player_flip_h() -> void:
	sprite.flip_h=true
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	#print(body.name)
	if body.is_in_group("Marsh"):
		inzone=true
		#print("nodeinside")
		bodyinzone=body


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Marsh"):
		inzone= false
	
