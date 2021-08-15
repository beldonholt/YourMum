extends Node2D  

var playerYes = false

func _ready():
	Global.On == false
	if is_processing_unhandled_input():
		pass
	

func _process(_delta):
	for i in $Area2D.get_overlapping_bodies():
		if i.is_in_group("Player"):
			playerYes = true
			if Input.is_action_just_pressed("Interact"):
				Global.currentCPP = position
				Global.On = true 
			if Global.On == false and Global.currentCPP != position:
				$Promt.visible = true
		else:
			playerYes = false
			
	if not playerYes:
		$Promt.visible = false 
		
	if Global.On:
		$Promt.visible = false 
		$AnimationPlayer.play("on")

	else:
		$AnimationPlayer.play("Cold")
		Global.On = false 
				
	if Global.currentCPP != position:
		$AnimationPlayer.play("Cold")
	



