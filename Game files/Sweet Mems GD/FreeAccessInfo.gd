extends Node

signal casset_change

var cassets = 0

func add_casset(count):
	cassets += count
	emit_signal("casset_change")
	

func change_scene(scene):
	get_tree().change_scene(scene)
	cassets = 0
