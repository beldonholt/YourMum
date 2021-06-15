extends KinematicBody2D
var GRAVITY = 1
var velocity = Vector2(0,0)
var fall = false

func _physics_process(_delta):
	if $Check.get_collider().is_in_group("Player") == true:
		fall = true
	if fall == true:
		fall()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Idle.visible = true
	$Active.visible = false 

func fall():
	$Check.enabled = false 
	velocity.y += GRAVITY
	position += velocity 
	$Idle.visible = false
	$Active.visible = true
