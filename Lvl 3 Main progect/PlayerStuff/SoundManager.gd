extends AudioStreamPlayer

var backgroundMusic = ["res://Assets/Audio/Another.mp3","res://Assets/Audio/Dungeon.mp3"]
var musicNum = 0

func _ready():
	Music_Play()
	pass
	
func _update():
	if not playing:
		Music_Play()

func Music_Play():
	randomize()
	musicNum = randi() % 2
	print(backgroundMusic[musicNum])
	stream = load(backgroundMusic[musicNum])
	play()
	pass
