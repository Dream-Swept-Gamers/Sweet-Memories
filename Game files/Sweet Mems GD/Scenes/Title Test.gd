extends Control



func _ready():
	pass



func _on_Creds_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
	pass # Replace with function body.


func _on_Level_Sel_pressed():
	get_tree().change_scene("res://Scenes/Level_Sel.tscn.tscn")
	pass # Replace with function body.
