extends Node
#this code is for the charter selection 
func _process(_delta):
	$AnimationPlayer.play("Charaters")
#if the player selects the male charater
func _on_PlayerOne_pressed():
	#makes sure it shows the right sprite 
	Global.PlayerSelection = true
	print("male")
	get_tree().change_scene("res://Levels/MainLevels/Tutorial.tscn")
	Global.recordPos = false
	
#if the player selects the female charater
func _on_PlayerTwo_pressed():
	#makes sure it shows the right sprite 
	Global.PlayerSelection = !true
	print("Female")
	get_tree().change_scene("res://Levels/MainLevels/Tutorial.tscn")
	Global.recordPos = false

