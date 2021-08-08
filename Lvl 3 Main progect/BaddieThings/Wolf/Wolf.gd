extends KinematicBody2D


#enemy Constants
const GRAVITY = 30
var SPEED =  100
#enemy Variables
var Velocity = Vector2(0,0)
# 1 means facing right in this term
var Direction = true

var WallX = 30

func _physics_process(_delta):
	Velocity.x = SPEED
	#checks if sprite is going right or left and faces acordingly
	#print(Direction)
	if Direction:
		SPEED = 100
		$AnimatedSprite.flip_h = true

	
	else:
		SPEED = -100
		$AnimatedSprite.flip_h = false

		#print("face left")
	
	
	#falls down and stops constant applying of velocity downwards
	Velocity.y += GRAVITY
	move_and_slide(Velocity)
	Velocity = move_and_slide(Velocity,Vector2.UP)
	
	#if it hits a wall changes direction
#	if $Wall.is_colliding():
#		#print("wall")
#		$Wall.scale.x *= -1
#		#Direction =  0
#		$RayCast2D.position.x *= -1
		
#	if $RayCast2D.is_colliding():
#		print("ahsafvhuak vbfgulaiuernhjkgntfihnwstjrnhwui4th")
	#if reaches edge of platform changes direction 
	
	if not $Ground.is_colliding():
		print("fuck")
		Direction = !Direction
		$Ground.position.x *= -1
		WallX *= -1
		$Wall.cast_to.x = WallX

	if $Wall.is_colliding() and not $Wall.get_collider().is_in_group("Player"):
		print("abfh")
		Direction = !Direction
		$Ground.position.x *= -1
		WallX *= -1
		$Wall.cast_to.x = WallX
