extends Node

var ActiveScene = ""
var PlayerPos = [Vector2(-66.338,209.765)]
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
	if (PlayerPos[-1] != Pos.round()):
		if PlayerPos.size() < ShadowSpawnTimer:
			PlayerPos.append(Pos.round())
			print(PlayerPos[-1])
			print(PlayerPos.size())
	pass

