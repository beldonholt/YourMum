extends Node

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
		
func _on_Start_pressed():
	get_tree().change_scene("res://CharterSelection.tscn")


func _on_Quit_pressed():
	get_tree().quit()
