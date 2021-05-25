extends KinematicBody2D

var ArrayPosition = 1

func _process(delta):
	if Global.ShadowSpawned:
		print("shadow spawned")
		global_position = global_position.move_toward(Global.PlayerPos[ArrayPosition], delta * 1000)
		if global_position == Global.PlayerPos[ArrayPosition]:
			ArrayPosition += 1
		pass
	pass
