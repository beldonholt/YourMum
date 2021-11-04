extends Node

	#saving the scene
func _ready():
#	Global.SPEED = 300
	#sets this scene as the current saved scen in global
	Global.sceneSave()
	if Global.ActiveScene == "Levels/MainLevels/LevelOne.tscn":
		$Player.position = Global.currentCPP

	
	Global.recordPos = true
	
