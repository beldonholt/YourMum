extends KinematicBody2D

#players variables 
var velocity = Vector2(0,0)
var SPEED = 500
var SpeedBonus = 0
var SprintYes = true
var Jumps = 2
var SpriteDireaction 
var PlayerSelction = ""

#const = constant (wont change/ fixed) 

const JUMPFORCE = -1300
var GRAVITY = 40

#making a dash overlay using a texture progress to show recharge 
onready var timer = get_node("Sprint_CoolDown")
onready var pb = get_node("CanvasLayer/TextureProgress")
func _ready():
	timer.wait_time = pb.value
	if Global.PlayerSelection:
		$Male.visible = true
		PlayerSelction = true
	else:
		$Female.visible = true
		PlayerSelction = !true
	
	
func _process(_delta):
	#print(timer.time_left)
	pb.value = timer.time_left
	pass

#func _physics_process(delta): does fucion at games refressh rate (60fps)
func _physics_process(_delta):
	#if female
	if PlayerSelction != true:
		if velocity == Vector2(0,0):
			$AnimationPlayer.play("Idle")
		#Sprint Code
		if Input.is_action_just_pressed("run") and SprintYes == true:
			$Sprint_timer.start()
			SpeedBonus = 3000
			print("start")
		if Input.is_action_pressed("run") and SprintYes == false:
			SpeedBonus = 0
		
		#Checks if "D" is pressed
		if Input.is_action_pressed("right"):
			#moves the player by the constant speed to the right 
			velocity.x = SPEED +SpeedBonus
			if is_on_floor() and $AnimationPlayer.current_animation != "Walk":
				$AnimationPlayer.play("Walk")
			get_node( "Female" ).set_flip_h( false )
			SpriteDireaction = false 
			#print("move right")
			
			
		#Checks id "A" is pressed 
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED -SpeedBonus 
			if is_on_floor() and $AnimationPlayer.current_animation != "Walk":
				$AnimationPlayer.play("Walk")
			get_node( "Female" ).set_flip_h( true )
			SpriteDireaction = true
			#print("move left")
		if velocity.y < 0:
				$AnimationPlayer.play("Jump")
		elif is_on_floor() == false:
				$AnimationPlayer.play("Fall")
				if is_on_floor():
					$AnimationPlayer.play("Land")
	#if male
	if PlayerSelction == true:
		if velocity == Vector2(0,0):
			$AnimationPlayer.play("Idle")
		#Sprint Code
		if Input.is_action_just_pressed("run") and SprintYes == true:
			$Sprint_timer.start()
			SpeedBonus = 3000
			print("start")
		if Input.is_action_pressed("run") and SprintYes == false:
			SpeedBonus = 0
		
		#Checks if "D" is pressed
		if Input.is_action_pressed("right"):
			#moves the player by the constant speed to the right 
			velocity.x = SPEED +SpeedBonus
			if is_on_floor() and $AnimationPlayer.current_animation != "Walk":
				$AnimationPlayer.play("Walk")
			get_node( "Male" ).set_flip_h( true )
			SpriteDireaction = true 
			#print("move right")
			
			
		#Checks id "A" is pressed 
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED -SpeedBonus 
			if is_on_floor() and $AnimationPlayer.current_animation != "Walk":
				$AnimationPlayer.play("Walk")
			get_node( "Male" ).set_flip_h( false )
			SpriteDireaction = false
			#print("move left")
		if velocity.y < 0:
				$AnimationPlayer.play("Jump")
		elif is_on_floor() == false:
				$AnimationPlayer.play("Fall")
				if is_on_floor():
					$AnimationPlayer.play("Land")
	
	#simulating Gravity with acceleration
	velocity.y += GRAVITY
	#print(velocity.y)
	if is_on_floor() == false:
		$CoyoteTimer.start()
		pass
	if is_on_floor():
		pass
		
	#Player jump input
	if Input.is_action_just_pressed("jump") and (is_on_floor() or ($CoyoteTimer.is_stopped() == false and Jumps > 1)):
		velocity.y = JUMPFORCE
		Jumps += -1 
		$CoyoteTimer.stop()
		#print("Single Jump")
		#print(Jumps)
		
	if Input.is_action_just_pressed("jump") and is_on_floor() == false and Jumps == 1 and $CoyoteTimer.is_stopped():
		velocity.y = JUMPFORCE
		Jumps += -1 
		#print("Double Jump")
		#print(Jumps)
	if is_on_floor():
		Jumps = 2
		#means it wont constantly move down even on an object
		#defines witch way is up so that the player can jump 
	velocity = move_and_slide(velocity,Vector2.UP)
		
		#player slows down when key not pressed
	velocity = velocity.move_toward(Vector2(0,0),25)
	



#func _on_FallZone_body_entered(body):
#	get_tree().change_scene("res://TestLevelMovement.tscn")
#	print("restart")

#this is function that deals with sending signals to global and starts the death sequence
func collide(area):
	#checking if i should be dying from the collision i am touching
	if area.is_in_group("DeathTouch"):
#		#Debug stuff
#		print("hit")
		#sending signal to global script
		Global.Death()
	else:
		print("no")


func _on_Sprint_timer_timeout():
	print("time out")
	SpeedBonus = 0
	SprintYes = false
	$Sprint_CoolDown.start()
	


func _on_Sprint_CoolDown_timeout():
#	print("Fast timeee")
	SprintYes = true


func _on_Area2D_area_entered(area):
#	print(area)
	collide(area) 



func _on_PositionTimer_timeout():
	if Global.recordPos == true:
		Global.AddPlayerPos(position)
#	print('timer')



func _on_Area2D_body_shape_entered(body_id, body, body_shape, local_shape):
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
	Global.recordPos = true
