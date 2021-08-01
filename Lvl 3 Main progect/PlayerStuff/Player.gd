extends KinematicBody2D

#players variables 
var velocity = Vector2(0,0)
var SpeedBonus = 0
var Jumps = 2
var SpriteDireaction 
var PlayerSelction = ""
var Death  = false
var CoyoteYes = true
var FloorJump = true
var Interactive = false
var Dashing
var CanDash = false 
var DashSpeed = 2000


#const = constant (wont change/ fixed) 

var JUMPFORCE = -1300
var GRAVITY = 38

#making a dash overlay using a texture progress to show recharge 
func _ready():
	Dashing = false
	if Global.PlayerSelection:
		$Male.visible = true
		PlayerSelction = true
	else:
		$Female.visible = true
		PlayerSelction = !true
	
	
func _process(_delta):
	if Input.is_action_just_pressed("Restart"):
		get_tree().change_scene(Global.ActiveScene)
		
	# audio players
	if $BackgroundMusic.playing == false and Global.ShadowSpawned == false:
		$BackgroundMusic.play()
	else:
		if $ShadowMusic.playing == false and Global.ShadowSpawned == true:
			$ShadowMusic.play()
	if is_on_wall():
		Dashing = false 
	if is_on_floor():
#		print("can dash")
		CanDash = true
	if is_on_floor() == false and Dashing == true:
		CanDash = false

	if CanDash == true:
		if Input.is_action_just_pressed("AblityOne") and (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
				Dashing = true
				print("dash")
				$AnimationPlayer.play("Dash")
				if SpriteDireaction == true:
					velocity.x = DashSpeed
				if SpriteDireaction !=true:
					velocity.x = -DashSpeed
				velocity.y = 0
				$Dash.start()

#func _physics_process(delta): does fucion at games refressh rate (60fps)
func _physics_process(_delta):
	
	# if female
	if PlayerSelction != true:
		if Dashing and $AnimationPlayer.is_playing() == false:
			$AnimationPlayer.play("Dash")
		if velocity == Vector2(0,0):
			$AnimationPlayer.play("Idle")
		if not Dashing:
		#Checks if "D" is pressed
			if Input.is_action_pressed("right"):
				#moves the player by the constant speed to the right 
				velocity.x = Global.SPEED 
				if is_on_floor():
					$AnimationPlayer.play("Walk")
				get_node( "Female" ).set_flip_h( true )
				SpriteDireaction = true 
				#print("move right")
				
				
			#Checks id "A" is pressed 
			elif Input.is_action_pressed("left"):
				velocity.x = -Global.SPEED
				if is_on_floor():
					$AnimationPlayer.play("Walk")
				get_node( "Female" ).set_flip_h( false )
				SpriteDireaction = false
				#print("move left")
			if velocity.y < 0 and Dashing == false:
					$AnimationPlayer.play("Jump")
			elif is_on_floor() == false:
					$AnimationPlayer.play("Fall")
					if is_on_floor():
						$AnimationPlayer.play("Land")
	#if male
	if PlayerSelction:
		if velocity == Vector2(0,0):
			$AnimationPlayer.play("Idle")
		if not Dashing:
		#Checks if "D" is pressed
			if Input.is_action_pressed("right"):
				#moves the player by the constant speed to the right 
				velocity.x = Global.SPEED 
				if is_on_floor():
					$AnimationPlayer.play("Walk")
				get_node( "Male" ).set_flip_h( true )
				SpriteDireaction = true 
				#print("move right")
				
				
			#Checks id "A" is pressed 
			elif Input.is_action_pressed("left"):
				velocity.x = -Global.SPEED 
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
	if not Dashing:
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
	if Input.is_action_just_pressed("jump") and Dashing == false:
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
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMPFORCE * 0.38 
		
		
		
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
	


func _on_Area2D_area_entered(area):
	collide(area) 



func _on_PositionTimer_timeout():
	if Global.recordPos == true:
		Global.AddPlayerPos(global_position)
#	print('timer')



func _on_Area2D_body_shape_entered(_body_id, _body, _body_shape, _local_shape):
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
	Global.recordPos = true
	Global.PlayerDeaths = 0



func _on_SoundPause_timeout():
	Death = true
	Global.Death()


func _on_Area2D_area_shape_exited(_area_id, _area, _area_shape, _local_shape):
	if _area.is_in_group("Interactive"):
		Interactive = false


func _on_Dash_timeout():
	SpeedBonus = 0
	Dashing = false
	$AnimationPlayer.stop()
	if SpriteDireaction == true:
		velocity.x = Global.SPEED
	if SpriteDireaction != true:
		velocity.x = -Global.SPEED
