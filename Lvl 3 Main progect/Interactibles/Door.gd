extends StaticBody2D

#Weater or not the door is closed

var DoorClosed = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$DoorAnimated.visible = false
	$DoorSprite.visible = true
	pass # Replace with function body.

func _process(delta):
	 if $AnimationPlayer.is_playing() == false and DoorClosed == true:
			$DoorSprite.visible = true 
			$DoorAnimated.visible = false
			


func _on_ButtonArea_area_exited(_area):
	print("exit")
	if _area.is_in_group("Interactive"):
		DoorClosed = true
		$AnimationPlayer.play("CloseDoor")
		
	pass # Replace with function body.

func _on_ButtonArea_area_entered(area):
	print("enter")
	if area.is_in_group("Interactive"):
		$DoorSprite.visible = false
		$DoorAnimated.visible = true
		DoorClosed = false
		$AnimationPlayer.play("OpenDoor")
	pass # Replace with function body.
