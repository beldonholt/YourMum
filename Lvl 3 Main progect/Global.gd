extends Node
#varibles 
var ActiveScene = "" #is the current scene 
var PlayerPos = [] #array for players position
var DifficultyTweak = 0.99 
var ShadowSpawnTimer = 100
var ShadowSpawned = false
var ShadowSpeed = 650
var PlayerDeaths = 0
var PlayerSelection = ""
var recordPos = false
var SPEED = 500
var currentCPP = Vector2(0,0)
var On 
var restart = false
var playerFirstPos = Vector2(0,0)
var value
var levelNumber = 0

	#checking for the time for the shadow to spawn
func _process(_delta):
	if (PlayerPos.size() + 30) >= ShadowSpawnTimer:
		ShadowSpawned = true

	#saving the current level scene
func sceneSave():
	ActiveScene = "Levels/MainLevels/" + get_tree().get_current_scene().get_name() + ".tscn"
	
#	print(ActiveScene)

	#This is the code sending the character to the shadow realm also known as the death scene
func Death():
	if restart == true:
		get_tree().change_scene("res://StartMenu.tscn")
		pass
	else:
		get_tree().change_scene("res://Levels/Ded/Dead.tscn")
		PlayerDeaths += 1
		print(PlayerDeaths)
		ShadowSpeed += 105
		pass
	ResetPlayerArray()
	ShadowSpawned = false
		
func EndGame():
	get_tree().change_scene("res://Levels/EndGameBad.tscn")

	#This adds the player position every second to an array for the shadow man to use
func AddPlayerPos(Pos):
	var intPos = Pos.round()
	if (PlayerPos.empty()) or (PlayerPos.back() != intPos):
#		if PlayerPos.size() <= ShadowSpawnTimer:
		PlayerPos.append(intPos)
#		print(str(PlayerPos.size()) + "-" + str(intPos))
		

 #reseting the player position
func ResetPlayerArray():
	PlayerPos = []

