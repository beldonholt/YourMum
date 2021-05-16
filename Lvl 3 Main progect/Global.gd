extends Node

var ActiveScene = ""

func sceneSave():
	ActiveScene = get_tree().get_current_scene().get_name() + ".tscn"
	print(ActiveScene)
	
func loadSave():
	get_tree().change_scene("res://"+ActiveScene)
	
	
