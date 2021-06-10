extends Node

func _on_Start_pressed():
	#when you press start it starts "wow" - owen willson
	get_tree().change_scene("res://CharterSelection.tscn")


func _on_Quit_pressed():
	get_tree().quit()
