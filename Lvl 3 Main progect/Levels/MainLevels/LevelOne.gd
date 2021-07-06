extends Node
var SPEED = Global.SPEED
	#saving the scene
func _ready():
	SPEED = 50
	#sets this scene as the current saved scen in global
	Global.sceneSave()
