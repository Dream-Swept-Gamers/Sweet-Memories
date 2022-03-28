extends Node2D

func _ready():
	PrefabsList.jigsaw_loc = global_position
	PrefabsList.signal_it()
	queue_free()
