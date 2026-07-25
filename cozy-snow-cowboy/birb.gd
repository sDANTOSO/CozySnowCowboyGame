extends Node2D
@onready var birb: AnimatedSprite2D = $RigidBody2D/AnimatedSprite2D
@onready var timer: Timer = $StartTimer
@onready var right_timer: Timer = $RightTimer
@onready var left_timer: Timer = $LeftTimer


var flyforward= true
var flybackward=false
var time = false
var alive = true
var health = 1
var damage : String = str(health)
var damage2 ="1"

func _ready() -> void:
	timer.start()
	add_to_group("enemy")

func hit () -> void:
	print ("hit")
	health += 1
	damage = damage2
	animate()
	
func animate():
	birb.play(Global.birdanimation)
	
func _on_timer_timeout() -> void:
	birb.play(Global.birdanimation)
	flyforward = true

func _physics_process(delta: float) -> void:
	
	birb.play(Global.birdanimation)
	
	
	if (alive == true):
		if (flyforward==true && position.x <702  ):	
			position.x = position.x + 180 * delta
		else: flyforward=false
			
		if (flyforward==false && position.x >-700):
			position.x = position.x -180 * delta
		else:flyforward=true
		birb.flip_h=false
	
	
func _process(delta: float) -> void:
	if (alive==true):
		if flyforward == false:
			birb.flip_h= true
	

func _on_rigid_body_2d_dead() -> void:
	alive = false
	pass # Replace with function body.
