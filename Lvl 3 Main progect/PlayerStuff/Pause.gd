extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		$Button.visible = true
		$Button2.visible = true
		$Grade.visible = true
		print("pause played")
		pass
	elif get_tree().paused == false:
		$Grade.visible = false
		$Button.visible = false
		$Button2.visible = false
	pass


func _on_Button_button_down():
	get_tree().paused = false
	get_tree().change_scene("res://StartMenu.tscn")
	return
	pass # Replace with function body.


func _on_Button2_button_down():
	get_tree().quit()
	pass # Replace with function body.
