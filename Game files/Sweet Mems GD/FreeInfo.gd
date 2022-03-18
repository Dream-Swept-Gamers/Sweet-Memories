extends Node
var random = RandomNumberGenerator.new()
var no = 0
var no2 = 0.0

func hit_me():
	pass

func move_type():
	no = random.randi_range(0, 2)
	return no

func move_time():
	no2 = random.randi_range(0.2, 1.8)
	return no2
