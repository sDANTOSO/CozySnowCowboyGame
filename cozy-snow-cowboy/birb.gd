extends Node2D
@onready var birb: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $StartTimer
@onready var right_timer: Timer = $RightTimer
@onready var left_timer: Timer = $LeftTimer


var flyforward= true
var flybackward=false
var time = false

func _ready() -> void:
	timer.start()

func _on_timer_timeout() -> void:
	birb.play("default")
	flyforward = true

func _physics_process(delta: float) -> void:
	birb.play("default")
	
	
	
	if (flyforward==true && position.x <702  ):	
		position.x = position.x + 180 * delta
	else: flyforward=false
		
	if (flyforward==false && position.x >-700):
		position.x = position.x -180 * delta
	else:flyforward=true
	birb.flip_h=false
	
	
func _process(delta: float) -> void:
	if flyforward == false:
		birb.flip_h= true
	
	
	#else: if (position.x == 602  ):
		#flybackward =true
	#else:if (birb.position.x < -600  ):
		#left_timer.start()
		#
		
		
#func flyback():
	#if (position.x > 505  ):
		#right_timer.start()
	#if (birb.position.x < -600  ):
		#left_timer.start()
#
#
#
#func _on_right_timer_timeout() -> void:
	#print("flying backward")
	#flybackward=true
#
#
#func _on_left_timer_timeout() -> void:
	#flyforward=true
