extends Node2D

var speed = 300
var ArrayPosition = 1

func _process(delta):
	if Global.ShadowSpawned:
#		print("shadow spawned")
		global_position = global_position.move_toward(Global.PlayerPos[0], delta * speed)
		if global_position == Global.PlayerPos[0]:
			Global.PlayerPos.pop_front()
		pass
	pass
