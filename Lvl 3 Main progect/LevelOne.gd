extends Node

func _ready():
	get_node("/root/Global").sceneSave(current_scene())

