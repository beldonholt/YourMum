extends KinematicBody2D

#enemy Constants
const GRAVITY = 30
const SPEED = 180 

#enemy Variables
var Velocity = Vector2(0,0)
# 1 means facing right in this term
var Direction = 1

func _physics_process(_delta):
	#moves right 
	Velocity.x = SPEED * Direction
	
	#print("e move right")
	#checks if sprite is going right or left and faces acordingly
	if Direction ==1:
		get_node( "AnimatedSprite" ).set_flip_h( true )
		
		#$AnimatedSprite.flip_h = false
		
		#print("face right")
		
	else:
		get_node( "AnimatedSprite" ).set_flip_h( false )
		#$AnimatedSprite.flip_h = true
		
		#print("face left")
	
	#$AnimatedSprite.play("walk")
	#falls down and stops constant applying of velocity downwards
	Velocity.y = Velocity.y + GRAVITY
	Velocity = move_and_slide(Velocity, Vector2.UP)
	
#	#if it hits a wall changes direction
#	if is_on_wall():
#		Direction = Direction* -1
#		#moves ray cast to right side if it hits a wall
#		$RayCast2D.position.x *= -1
#		#moves death box to the other side
#		$Area2D/CollisionShape2D.position.x *= -1
	if $Wall.is_colliding():
		#print("wall")
		$Wall.scale.x *= -1
		Direction = Direction* -1
		$RayCast2D.position.x *= -1
		$Area2D/CollisionShape2D.position.x *= -1
		
		
	#if reaches edge of platform changes direction 
	if $RayCast2D.is_colliding() == false:
		print("")
		Direction = Direction* -1
		$RayCast2D.position.x *= -1
		$Area2D/CollisionShape2D.position.x *= -1
		$Wall.rotation_degrees *= -1

	
