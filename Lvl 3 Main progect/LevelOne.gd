extends Node

func _ready():
	get_node("/root/Global").sceneSave(get_tree().get_current_scene())

