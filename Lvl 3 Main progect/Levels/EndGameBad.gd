extends Node2D

func _ready():
	
	$AnimationPlayer.play("Scroll")
	

func _process(delta):
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play("End")
		set_process(false)
