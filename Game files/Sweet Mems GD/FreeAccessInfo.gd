extends Node

signal casset_change

var random = RandomNumberGenerator.new()

var cassets = 0


func add_casset(count):
	cassets += count
	emit_signal("casset_change")
	

func change_scene(scene):
	get_tree().change_scene(scene)
	cassets = 0


func RN_Jesus(type, r1, r2):
	var no_int = 0
	var no_fl = 0.1
	
	match type:
		0:
			no_int = random.randi_range(r1, r2)
			return(no_int)
		1:
			no_fl = random.randf_range(r1, r2)
			return(no_fl)

