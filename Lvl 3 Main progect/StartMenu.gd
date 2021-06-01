extends Node
func _ready():
	$AnimationPlayer.play("TitleText")
	$AnimationPlayer.play("BackGroundFade")
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/MainLevels/LevelOne.tscn")
