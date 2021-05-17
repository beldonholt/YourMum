extends KinematicBody2D

#players variables 
var velocity = Vector2(0,0)
var SPEED = 300
var SpeedBonus = 0
var SprintYes = true
var Jumps = 1
var SpriteDireaction 
#const = constant (wont change/ fixed) 

const JUMPFORCE = -600
const GRAVITY = 30

#func _physics_process(delta): does fucion at games refressh rate (60fps)
func _physics_process(delta):
		
	#Sprint Code
	if Input.is_action_just_pressed("run") and SprintYes == true:
		SpeedBonus = 300
		$Sprint_timer.start()
		print("start")
	if Input.is_action_pressed("run") and SprintYes == false:
		SpeedBonus = 0
		
	
	#Checks if "D" is pressed
	if Input.is_action_pressed("right"):
		#moves the player by the constant speed to the right 
		velocity.x = SPEED +SpeedBonus
		#$Sprite.play("Walk")
		get_node( "Sprite" ).set_flip_h( false )
		SpriteDireaction = false 
		#print("move right")
		
		
	#Checks id "A" is pressed 
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED -SpeedBonus 
		#$Sprite.play("Walk")
		get_node( "Sprite" ).set_flip_h( true )
		SpriteDireaction = true
		#print("move left")
	
	 
		
	
	#simulating Gravity with acceleration
	velocity.y = velocity.y + GRAVITY
	#print(velocity.y)
	
	#Player jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		
	if Input.is_action_just_pressed("jump") and is_on_floor() == false and Jumps == 1:
		velocity.y = JUMPFORCE
		Jumps = Jumps -1 
	if is_on_floor():
		Jumps = 1
	
	#means it wont constantly move down even on an object
	#defines witch way is up so that the player can jump 
	velocity = move_and_slide(velocity,Vector2.UP)
	
	#player slows down when key not pressed
	velocity.x = lerp(velocity.x,0,0.1)
	


#func _on_FallZone_body_entered(body):
#	get_tree().change_scene("res://TestLevelMovement.tscn")
#	print("restart")


func collide(area):
	if area.is_in_group("DeathTouch"):
		print("hit")
		get_node("/root/Global").loadSave()


func _on_Sprint_timer_timeout():
	print("time out")
	SprintYes = false
	$Sprint_CoolDown.start()
	


func _on_Sprint_CoolDown_timeout():
	print("Fast timeee")
	SprintYes = true


func _on_Area2D_area_entered(area):
	print(area)
	collide(area) 
