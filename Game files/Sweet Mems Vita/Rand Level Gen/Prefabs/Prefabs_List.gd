extends Node
var pref = 0
var pref2 : String

var prefabs : Array = ["res://Rand Level Gen/Prefabs/Gas Challenge.tscn", "res://Rand Level Gen/Prefabs/Brandin.tscn",
"res://Rand Level Gen/Prefabs/Jumping.tscn", "res://Rand Level Gen/Prefabs/Spikey.tscn",
"res://Rand Level Gen/Prefabs/Fall.tscn", "res://Rand Level Gen/Prefabs/maze.tscn",
"res://Rand Level Gen/Prefabs/maze_2.tscn", "res://Rand Level Gen/Prefabs/Spikey poison.tscn",
"res://Rand Level Gen/Prefabs/maze_2_2.tscn", "res://Rand Level Gen/Prefabs/Monster_Vil.tscn"]

var jigsaw_loc = Vector2.ZERO

signal jigsaw_move

func rand_prefab():
	pref = FreeAccessInfo.RN_Jesus(1, 0, prefabs.size())
	pref2 = prefabs[pref]
	return(pref2)

func signal_it():
	emit_signal("jigsaw_move")
