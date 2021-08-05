extends Node2D

var ArrayPosition = 1
var firstPosMove = false

func _process(delta):
#	if firstPosMove == false and Global.currentCPP != Vector2(0,0):
#		Node2D.position = Global.currentCPP
#		firstPosMove = true
	if Global.ShadowSpawned:
#		print("shadow spawned")
		if not Global.PlayerPos.empty():
			global_position = global_position.move_toward(Global.PlayerPos[0], delta * Global.ShadowSpeed)
			if global_position == Global.PlayerPos[0]:
				Global.PlayerPos.pop_front()
		pass
	pass

