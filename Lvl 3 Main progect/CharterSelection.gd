extends Node

func _on_PlayerOne_pressed():
	Global.PlayerSelection = true
	print("male")
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")

func _on_PlayerTwo_pressed():
	Global.PlayerSelection = !true
	print("Female")
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")

