extends Node2D

signal boxdropped

@onready var box: CharacterBody2D=$RigidBody2D
@onready var top: Sprite2D=$RigidBody2D/CryoTopHalf
@onready var bottom: Sprite2D=$RigidBody2D/CryoBottomHalf
@onready var player: AnimatedSprite2D= $RigidBody2D/AnimatedSprite2D
#@onready var groundvector: Marker2D= $"../Maincharacter/Ground2"
#@onready var player = get_parent().get_node("Maincharacter")
#@onready var groundvector = get_parent().get_node("Maincharacter/Ground2")


#var y 
#
#var speed = 20
#var player_pos
#var target_pos
#var direction1 
#var target_direction
#
#var hey= false
#
#
#
#func _ready() -> void:
	#add_to_group("branch")
	#y = groundvector.position.y
	#print(groundvector.position.y)
func hit () -> void:
	boxdropped.emit()
	#
	#hey=true
	#box.gravity_scale=0.3
	#bottom.rotation = 45
	
	#
#func _physics_process(_delta: float) -> void:
	#if (hey == true ):
		#box.gravity_scale = 1.0
		#direction1 = Vector2(0,y)
		#direction1.x=player.position.x
		#
		##target_direction= Vector2(player.position.x.normalized-,)
		#
		##target_pos =(player.position.x.normalized)
		#target_pos = (direction1- position).normalized()
		#print (player.position.x)
		#print (player.position)
		#
		#if position.distance_to(direction1) > 3:
			#position += target_pos * speed * _delta 
