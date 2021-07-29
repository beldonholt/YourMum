extends Node2D  


# Called when the node enters the scene tree for the first time.
func _ready():
	print("this is to annoy daniel west :)")
	pass # Replace with function body.

func _process(delta):
	for i in $Area2D.get_overlapping_bodies():
		if i.is_in_group("Player"):
			Global.currentCPP = position
			pass
		pass
	pass



