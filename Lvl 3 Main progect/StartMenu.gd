extends Node

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and $Options_menu.visible == true:
		$Options_menu.visible = false
		$"Main Menu".visible = true
	if $Options_menu/FullScreen.pressed == true:
		OS.window_fullscreen = true
	if $Options_menu/FullScreen.pressed == false:
		OS.window_fullscreen = false
		
func _ready():
	$Options_menu.visible = false
	OS.window_fullscreen = true
func _on_Start_pressed():
	#when you press start it starts "wow" - owen willson
	get_tree().change_scene("res://CharterSelection.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Options_pressed():
	print("this ")
	$Options_menu.visible = true
	$"Main Menu".visible = false

