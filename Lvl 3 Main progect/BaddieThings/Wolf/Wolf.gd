extends KinematicBody2D

#enemy Constants
const GRAVITY = 30
var SPEED = 180 

#enemy Variables
var Velocity = Vector2(0,0)
# 1 means facing right in this term
var Direction = 1

func _physics_process(_delta):
	Velocity.x = SPEED
	#checks if sprite is going right or left and faces acordingly
	#if Direction == 1:
	#	get_node( "AnimatedSprite" ).set_flip_h( true )
	#	SPEED = 180
		
		#$AnimatedSprite.flip_h = false
		
		#print("face right")
		
	#if Direction == 0:
	#	#get_node( "AnimatedSprite" ).set_flip_h( false )
	#	SPEED = -180
		#$AnimatedSprite.flip_h = true
		
		#print("face left")
	
	
	#falls down and stops constant applying of velocity downwards
	#Velocity.y = GRAVITY
	#print(Velocity,position,_delta)
#	move_and_slide(Velocity)
	
#	#if it hits a wall changes direction
#	if is_on_wall():
#		Direction = Direction* -1
#		#moves ray cast to right side if it hits a wall
#		$RayCast2D.position.x *= -1
#		#moves death box to the other side
#		$Area2D/CollisionShape2D.position.x *= -1

#	if $Wall.is_colliding():
#		#print("wall")
#		$Wall.scale.x *= -1
#		Direction =  0
#		$RayCast2D.position.x *= -1
#		$Area2D/CollisionShape2D.position.x *= -1
#
#	if $RayCast2D.is_colliding():
#		print("onFLoor")
#	#if reaches edge of platform changes direction 
#	if $RayCast2D.is_colliding() == false:
#		print("qw we  qtrwet wre")
#		Direction = 0
#		$RayCast2D.position.x *= -1
#		$Area2D/CollisionShape2D.position.x *= -1
#		$Wall.rotation_degrees *= -1

func _process(delta):
	print(position)
	move_and_slide(Vector2(100,10))
