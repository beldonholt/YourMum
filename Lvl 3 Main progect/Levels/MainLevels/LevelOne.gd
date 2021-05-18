extends Node

func _ready():
	Global.sceneSave()
	#get_node("/root/Global").sceneSave(get_tree().get_current_scene())

