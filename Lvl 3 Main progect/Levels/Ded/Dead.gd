extends Node2D

#when the button on the death scene is pressed loads scene 
#from load scene cods
func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		$Button.loadscene()
