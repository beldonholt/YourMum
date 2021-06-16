extends StaticBody2D

var DoorClosed = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	$DoorAnimated.visible = false
	$DoorSprite.visible = true
	pass # Replace with function body.

func _process(delta):
#	if not $AnimationPlayer.is_playing() and DoorClosed:
#		$AnimationPlayer.play("Idle")
	if DoorClosed == true:
		$DoorSprite.visible = true 
		$DoorAnimated.visible = false
	else:
		$DoorAnimated.visible = true
		if not $AnimationPlayer.is_playing():
			$DoorSprite.visible = false 
		
	


func _on_ButtonArea_area_exited(_area):
	print("exit")
	if _area.is_in_group("Interactive"):
		DoorClosed = true
		$AnimationPlayer.play_backwards("OpenDoor")
	pass # Replace with function body.

func _on_ButtonArea_area_entered(area):
	print("enter")
	if area.is_in_group("Interactive"):
		DoorClosed = false
		$AnimationPlayer.play("OpenDoor")
	pass # Replace with function body.
