extends Node2D  
func _ready():
	Global.On == false
	

func _process(delta):
	for i in $Area2D.get_overlapping_bodies():
		if i.is_in_group("Player"):
			if Input.is_action_just_pressed("Interact"):
				Global.currentCPP = position
				Global.On = true 
			if Global.On == false and Global.currentCPP != position:
				$Promt.visible = true
	if Global.On:
		$Promt.visible = false 
		$AnimationPlayer.play("on")

	else:
		$AnimationPlayer.play("Cold")
				
	if Global.currentCPP != position:
		$AnimationPlayer.play("Cold")
	



