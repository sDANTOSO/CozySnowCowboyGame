extends RigidBody2D
@onready var birb: AnimatedSprite2D = $AnimatedSprite2D

signal dead

var health = 1
var damage : String = str(health)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy")

func hit () -> void:
	if (health<7):
		health += 0.5
		animate()
	else: 
		Global.birdanimation = ("dead")
		birb.play("dead")
		dead.emit()
		gravity_scale =1
		pass

func animate():
		Global.birdanimation = str(health)
		birb.play(Global.birdanimation)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
