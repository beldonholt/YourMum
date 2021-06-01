extends Node

func _physics_process(_delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
	
func _ready():
	$AnimationPlayer.play("TitleText")
	$AnimationPlayer.play("BackGroundFade")



func _on_Button_pressed():
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
