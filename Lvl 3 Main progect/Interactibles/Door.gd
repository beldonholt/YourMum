extends StaticBody2D

var DoorClosed = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")
	pass # Replace with function body.

func _process(delta):
	if not $AnimationPlayer.is_playing() and DoorClosed:
		$AnimationPlayer.play("Idle")


func _on_ButtonArea_area_entered(area):
	print("enter")
	if area.is_in_group("Interactive"):
		$AnimationPlayer.play("OpenDoor")
		DoorClosed = false
		pass
	pass # Replace with function body.


func _on_ButtonArea_area_exited(area):
	print("exit")
	if area.is_in_group("Interactive"):
		$AnimationPlayer.play_backwards("OpenDoor")
		DoorClosed = true

	pass # Replace with function body.
