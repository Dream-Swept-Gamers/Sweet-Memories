extends Node

func _ready():
	var login_screen = preload("res://Multiplayer/Login Screen.tscn")
	var New_Scene = login_screen.instance()
	add_child(New_Scene)

func Load_Scene(scene_path):
	var New_Scene = Load_Scene(scene_path)
	if get_child_count() != 0:
		Remove_Children()
	New_Scene.instance()

func Remove_Children():
	for i in get_child_count():
		get_child(0).queue_free()
