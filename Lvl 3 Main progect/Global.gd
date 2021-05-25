extends Node

var ActiveScene = ""
var PlayerPos = []
var DifficultyTweak = 0.99
var ShadowSpawnTimer = 100
var ShadowSpawned = false
var PlayerDeaths = 0


func _process(delta):
	if (PlayerPos.size() + 30) >= ShadowSpawnTimer:
		ShadowSpawned = true
		pass
	pass

func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)
	
func loadSave():
	get_tree().change_scene("res://Levels/Ded/Ded.tscn")
	PlayerDeaths += 1
	print(PlayerDeaths)
	ResetPlayerArray()
	ShadowSpawned = false

func AddPlayerPos(Pos):
	var intPos = Pos.round()
	if PlayerPos.back() != intPos:
		if PlayerPos.size() <= ShadowSpawnTimer:
			PlayerPos.append(intPos)
			print(intPos)
			print(PlayerPos.size())


func ResetPlayerArray():
	PlayerPos = []

