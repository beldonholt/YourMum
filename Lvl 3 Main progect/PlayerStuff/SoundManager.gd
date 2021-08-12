extends Node

func _ready():
	$BackgroundMusic.play()
	pass

func _process(delta):
	if not $BackgroundMusic.is_playing():
		$BackgroundMusic.play()
