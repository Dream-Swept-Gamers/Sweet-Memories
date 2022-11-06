extends Node
var cheating = false

var cur_player_instance = RefCounted

signal casset_change

var random = RandomNumberGenerator.new()

var cassets = 0

signal Prefab_Complete

func add_casset(count):
	cassets += count
	emit_signal("casset_change")

func cassette_collected(id):
	PlayerSaveFile.cassettes[id] = true
	return
	#Does the dictionary have the cassetts ID already?
	if PlayerSaveFile.cassettes.has(id) and false == true:
		#Has the cassette been collected yet?
		#var val = PlayerSaveFile.cassettes.get(id)
		#if val:
			#If it has, no need to change it
			#This should never be run, but it exists just in case
			return
		#else:
			#If it exists, and is false, set it to true
			#This shouldn't be run, but it's here just in case
			PlayerSaveFile.cassettes[id] = true
	else:
		#If the dictionary doesn't contain the cassettes ID, add it, and set it to true
		PlayerSaveFile.cassettes[id] = true
	pass

func shrodingers_cassette(id):
	#This function is run by the cassette to see if it's been collected
	#It should only really be in the save file if it already has been
	#Thus, the function only detects if it's in
	if PlayerSaveFile.cassettes.has(id):
		return true
	else:
		return false

func change_scene_to_file(scene):
	get_tree().change_scene_to_file(scene)
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


#### Interminable Mode
func Prefab_completeed():
	emit_signal("Prefab_Complete")
	print("Prefab Completed")

