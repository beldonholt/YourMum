extends Node

func _on_PlayerOne_pressed():
	Global.PlayerSelection = true
	print("male")
	get_tree().change_scene("res://Levels/MainLevels/Tutorial.tscn")
	Global.recordPos = false

func _on_PlayerTwo_pressed():
	Global.PlayerSelection = !true
	print("Female")
	get_tree().change_scene("res://Levels/MainLevels/Tutorial.tscn")
	Global.recordPos = false

