extends Node

var ActiveScene = ""
var PlayerPos = []
var DifficultyTweak = 0.99
var ShadowSpawnTimer = 50
var ShadowSpawned = false
var PlayerDeaths = 0


func _process(_delta):
	if (PlayerPos.size() + 30) >= ShadowSpawnTimer:
		ShadowSpawned = true

func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)
	
func Death():
	get_tree().change_scene("res://Levels/Ded/Dead.tscn")
	PlayerDeaths += 1
	print(PlayerDeaths)
	ResetPlayerArray()
	ShadowSpawned = false
	


func AddPlayerPos(Pos):
	var intPos = Pos.round()
	if PlayerPos.back() != intPos:
		if PlayerPos.size() <= ShadowSpawnTimer:
			PlayerPos.append(intPos)
#			print(intPos)
#			print(PlayerPos.size())


func ResetPlayerArray():
	PlayerPos = []

