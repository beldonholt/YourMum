extends Node

var ActiveScene = ""
var PlayerPos = []
var DifficultyTweak

func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)
	
func loadSave():
	get_tree().change_scene("res://Levels/Ded/Ded.tscn")

func AddPlayerPos(Pos):
	if PlayerPos.size() < 100:
		PlayerPos.append(Pos)
		print(Pos)
		print(PlayerPos.size())
