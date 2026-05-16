extends RigidBody2D

@onready var branch: RigidBody2D =$"."
@onready var cryo: Node2D =$"../../Capybara"
@onready var tree: StaticBody2D = $"../MainTree"

var hey = false

func _ready() -> void:
	add_to_group("branch")
	
func hit () -> void:
	
	hey=true
	branch.gravity_scale=1.0
	cryo.hit()
	tree.hit()
	print("yay")
	
	
	
func _physics_process(_delta: float) -> void:
	if (hey == true ):
		branch.gravity_scale = 0.5
		
		


func _on_body_entered(body: Node) -> void:
	print (body)
	if body.is_in_group("projectile"):
		
		hey=true
		branch.gravity_scale=1.0
		print("thisishowbranch")
	
