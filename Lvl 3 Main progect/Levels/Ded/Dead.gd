extends Node2D

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$Button.loadscene()
