extends KinematicBody2D
var GRAVITY = 4000
var velocity = Vector2(0,0)
var fall = false

func _physics_process(_delta):
	if $Check.get_collider().is_in_group("Player"):
		fall = true
	if fall == true:
		velocity.y += GRAVITY*_delta
		position += velocity*_delta
	else:
		pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$Idle.visible == true
	$Active.visible == false 

