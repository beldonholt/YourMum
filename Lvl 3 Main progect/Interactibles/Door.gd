extends StaticBody2D

var DoorClosed = true
var speed = 50

func _on_ButtonArea_area_exited(_area):
	print("exit")
	if _area.is_in_group("Interactive") and not DoorClosed:
		DoorClosed = true
	pass 

func _on_ButtonArea_area_entered(area):
	print("enter")
	if area.is_in_group("Interactive") and DoorClosed:
		DoorClosed = false
	pass 

func _process(delta):
	if DoorClosed:
		$DoorSprite.position = $DoorSprite.position.move_toward(Vector2(0,0),speed*delta)
		$DoorCollision.position = $DoorCollision.position.move_toward(Vector2(0,0),speed*delta)
	else:
		$DoorSprite.position = $DoorSprite.position.move_toward(Vector2(0,50),speed*delta)
		$DoorCollision.position = $DoorCollision.position.move_toward(Vector2(0,50),speed*delta)
