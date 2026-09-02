extends RigidBody2D

@onready var branch: RigidBody2D =$"."
@onready var cryo: Node2D =$"../../Capybara"
@onready var tree: StaticBody2D = $"../MainTree"

var dropped = false

func _ready() -> void:
	add_to_group("branch")

func hit () -> void:
	dropped=true # so that dropped being true can now be checked everywhere
	cryo.hit()#calls  hit on the cryobox
	tree.hit()#calls hit on the main tree which changes where marsh can spawn


func _physics_process(_delta: float) -> void:
	if (dropped == true ):#sets branches gravity
		branch.gravity_scale = 0.5
