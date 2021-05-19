extends Button

onready var global_vars = get_node("/root/Global")

func loadscene():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://"+global_vars.ActiveScene)

func _on_Button_pressed():
	loadscene()
