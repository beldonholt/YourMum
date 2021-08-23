extends Node

var backgroundMusic = ["res://Assets/Audio/Another.mp3","res://Assets/Audio/Dungeon.mp3"]
var musicNum = 0

func _ready():
	randomize()
	musicNum = randi() % 2
	print(backgroundMusic[musicNum])
	$BackgroundMusic.stream = backgroundMusic[musicNum]
	$BackgroundMusic.play()
	pass

func _process(delta):
	pass
