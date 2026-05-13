extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D =%AnimatedSprite2D
@onready var rider_container: Node2D =$RiderContainer
@onready var rider_position: Marker2D = $RiderPosition
#@onready var main_character: CharacterBody2D = $"../../Maincharacter"
#@onready var main_character_sprite: AnimatedSprite2D
signal player_flip_h()
signal player_dont_flip_h()

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var direction1:Vector2=Vector2.ZERO
var inUse = false
var body1 = null;

#func _ready():
	#main_character = get_node("CharacterSprite")
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dismount") && inUse: 
		dismount()
	
	#if inUse == true :
		#call_deferred("do_ride",body1)
	
	if not inUse:
		animated_sprite_2d.play("default")
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
	
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.play("Walking")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#while velocity.x > 0:
		

	move_and_slide()
	update_facing_direction()
	
	
func update_facing_direction()  :
	if direction1.x > 0 :
		animated_sprite_2d.flip_h=false
		#if inUse==true:
		dont_flip_h()
	elif direction1.x <0:
		animated_sprite_2d.flip_h=true
		#if inUse==true:
			#main_character.flip_h=true 
		_flip_h()
			

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.inUse = false
		animated_sprite_2d.flip_h = animated_sprite_2d.flip_h
		body1 = body
		call_deferred("do_ride",body)
		
func do_ride (rider):
	rider.reparent(rider_container)
	rider.global_position = rider_position.global_position
	inUse = true 
	
func _flip_h():
	player_flip_h.emit()
	
func dont_flip_h():
	player_dont_flip_h.emit()
	
func animation():
	print()
	
func dismount():
	inUse = false
	animated_sprite_2d.flip_h=false
	rider_container.scale.x =1 
	
	var player = rider_container.get_children()[0]
	
	player.reparent (get_tree().current_scene)
	player.inUse = true
	player.position.x -=25
