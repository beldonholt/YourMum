extends Node
#varibles 
var ActiveScene = "" #is the current scene 
var PlayerPos = [] #array for players position
var DifficultyTweak = 0.99 
var ShadowSpawnTimer = 40
var ShadowSpawned = false
var ShadowSpeed = 650
var PlayerDeaths = 0
var PlayerSelection = ""
var recordPos = false

	#checking for the time for the shadow to spawn
func _process(_delta):
	if (PlayerPos.size() + 30) >= ShadowSpawnTimer:
		ShadowSpawned = true

	#saving the current level scene
func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)

	#This is the code sending the character to the shadow realm also known as the death scene
func Death():
	get_tree().change_scene("res://Levels/Ded/Dead.tscn")
	PlayerDeaths += 1
	print(PlayerDeaths)
	ResetPlayerArray()
	ShadowSpawned = false
	ShadowSpeed += 10

	#This adds the player position every second to an array for the shadow man to use
func AddPlayerPos(Pos):
	var intPos = Pos.round()
	if PlayerPos.back() != intPos:
		if PlayerPos.size() <= ShadowSpawnTimer:
			PlayerPos.append(intPos)
#			print(intPos)
#			print(PlayerPos.size())

 #reseting the player position
func ResetPlayerArray():
	PlayerPos = []

