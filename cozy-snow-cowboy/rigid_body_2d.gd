extends RigidBody2D
@onready var crapler: AnimatedSprite2D =$AnimatedSprite2D
var health = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("enemy")
	
func hit () -> void:
	health += 1
	animate()
	print("craplerhit")

func animate():
	#crapler.play("damage")
	crapler.frame = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
