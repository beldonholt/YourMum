extends Node

var ActiveScene = ""
var PlayerPos = []
var DifficultyTweak = 0.99
var ShadowSpawnTimer = 40
var ShadowSpawned = false
var ShadowSpeed = 650
var PlayerDeaths = 0
var PlayerSelection = ""
var recordPos = ""


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
	ShadowSpeed += 10
	


func AddPlayerPos(Pos):
	var intPos = Pos.round()
	if PlayerPos.back() != intPos:
		if PlayerPos.size() <= ShadowSpawnTimer:
			PlayerPos.append(intPos)
#			print(intPos)
#			print(PlayerPos.size())


func ResetPlayerArray():
	PlayerPos = []

