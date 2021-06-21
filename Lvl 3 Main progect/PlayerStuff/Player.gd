extends KinematicBody2D

#players variables 
var velocity = Vector2(0,0)
var SPEED = 500
var SpeedBonus = 0
var SprintYes = true
var Jumps = 2
var SpriteDireaction 
var PlayerSelction = ""
var Death  = false
var CoyoteYes = true
var FloorJump = true
var Interactive = false

#const = constant (wont change/ fixed) 

var JUMPFORCE = -1300
var GRAVITY = 40

#making a dash overlay using a texture progress to show recharge 
onready var timer = get_node("Sprint_CoolDown")
onready var pb = get_node("CanvasLayer/TextureProgress")
func _ready():
	
	if Global.PlayerSelection:
		$Male.visible = true
		PlayerSelction = true
	else:
		$Female.visible = true
		PlayerSelction = !true
	
	
func _process(_delta):
	#print(timer.time_left
	if timer.wait_time > 0 and pb.value > 0:
		timer.wait_time = pb.value
	if is_on_floor():
		SprintYes = true
		$Sprint_CoolDown.set_wait_time(1)
	elif is_on_floor() == false:
		$Sprint_CoolDown.set_wait_time(5)
	pb.value = timer.time_left
	pass
	# audio players
	if $BackgroundMusic.playing == false and Global.ShadowSpawned == false:
		$BackgroundMusic.play()
	else:
		if $ShadowMusic.playing == false and Global.ShadowSpawned == true:
			$ShadowMusic.play()

#func _physics_process(delta): does fucion at games refressh rate (60fps)
func _physics_process(_delta):
	
		#Sprint Code
		#This is now the dash code
	if Input.is_action_just_pressed("run") and SprintYes == true:
		$Sprint_timer.start()
		$AnimationPlayer.play("Dash") 
		SpeedBonus = 3000
		print("start")
	if Input.is_action_pressed("run") and SprintYes == false:
			SpeedBonus = 0
			
			
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
			if is_on_floor():
				$AnimationPlayer.play("Walk")
			get_node( "Female" ).set_flip_h( true )
			SpriteDireaction = true 
			#print("move right")
			
			
		#Checks id "A" is pressed 
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED -SpeedBonus 
			if is_on_floor():
				$AnimationPlayer.play("Walk")
			get_node( "Female" ).set_flip_h( false )
			SpriteDireaction = false
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


		#Checks if "D" is pressed
		if Input.is_action_pressed("right"):
			#moves the player by the constant speed to the right 
			velocity.x = SPEED +SpeedBonus
			if is_on_floor():
				$AnimationPlayer.play("Walk")
			get_node( "Male" ).set_flip_h( true )
			SpriteDireaction = true 
			#print("move right")
			
			
		#Checks id "A" is pressed 
		elif Input.is_action_pressed("left"):
			velocity.x = -SPEED -SpeedBonus 
			if is_on_floor():
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
		#coyote Jump timer stuff
	if not is_on_floor() and CoyoteYes and Jumps == 2:
		if $CoyoteTimer.is_stopped():
			$CoyoteTimer.start()
			CoyoteYes = false
			print("start coyote timer")
		pass
		
		#resetting the players jump
	if is_on_floor():
		Jumps = 2
		CoyoteYes = true
	
		#making the player jump
	if Input.is_action_just_pressed("jump"):
		if (is_on_floor() or not $CoyoteTimer.is_stopped()) and Jumps == 2: #coyote timer running 
				velocity.y = JUMPFORCE
				Jumps = 1
				$CoyoteTimer.stop()
				print("Single Jump")
				print(Jumps)
		elif not is_on_floor():
			if Jumps >= 1:
				if $CoyoteTimer.is_stopped():
					velocity.y = JUMPFORCE
					Jumps = 0
					print("Double Jump")
					print(Jumps)
		
		
		
		#means it wont constantly move down even on an object
		#defines witch way is up so that the player can jump 
	velocity = move_and_slide(velocity,Vector2.UP)
		
		#player slows down when key not pressed
	velocity = velocity.move_toward(Vector2(0,0),25)
	
	interact()



#func _on_FallZone_body_entered(body):
#	get_tree().change_scene("res://TestLevelMovement.tscn")
#	print("restart")
func interact():
	if Interactive and Input.is_action_just_pressed("Interact"):
		
		pass
	pass

#this is function that deals with sending signals to global and starts the death sequence
func collide(area):
	#checking if i should be dying from the collision i am touching
	if area.is_in_group("DeathTouch"):
#		#Debug stuff
#		print("hit")
		#sending signal to global script
		#connecting so it can play the sound
		$Sounds/Death.play()
		$Sounds/SoundPause.start()
	




func _on_Sprint_timer_timeout():
	print("time out")
	SpeedBonus = 0
	SprintYes = false
	GRAVITY = 40
	if is_on_floor():
		$Sprint_CoolDown.set_wait_time(2)
		$Sprint_CoolDown.start()
	else:
		$Sprint_CoolDown.set_wait_time(5)
		$Sprint_CoolDown.start()
	


func _on_Sprint_CoolDown_timeout():
#	print("Fast timeee")
	$Sounds/DashRecharge.play()
	SprintYes = true


func _on_Area2D_area_entered(area):
	collide(area) 



func _on_PositionTimer_timeout():
	if Global.recordPos == true:
		Global.AddPlayerPos(position)
#	print('timer')



func _on_Area2D_body_shape_entered(_body_id, _body, _body_shape, _local_shape):
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
	Global.recordPos = true
	Global.PlayerDeaths = 0



func _on_SoundPause_timeout():
	Death = true
	Global.Death()


func _on_Area2D_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	if _area.is_in_group("Interactive"):
		Interactive = false
