extends Node
var pref = 0
var pref2 : String

var prefabs : Array = ["res://Rand Level Gen/Prefabs/Gas Challenge.tscn", "res://Rand Level Gen/Prefabs/Brandin.tscn"]

var jigsaw_loc = Vector2.ZERO

signal jigsaw_move

func rand_prefab():
	pref = FreeAccessInfo.RN_Jesus(1, 0, prefabs.size())
	pref2 = prefabs[pref]
	return(pref2)

func signal_it():
	emit_signal("jigsaw_move")