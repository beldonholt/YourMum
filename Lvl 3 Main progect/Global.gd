extends Node

var ActiveScene = ""
var PlayerPos = []
var DifficultyTweak = 0.99
var ShadowSpawnTimer = 100000
var PlayerDeaths = 0

func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)
	
func loadSave():
	get_tree().change_scene("res://Levels/Ded/Ded.tscn")
	PlayerDeaths += 1
	print(PlayerDeaths)

func AddPlayerPos(Pos):
	if PlayerPos.back() != Pos:
		if PlayerPos.size() < ShadowSpawnTimer:
			PlayerPos.append(Pos)
			print(Pos)
			print(PlayerPos.size())

