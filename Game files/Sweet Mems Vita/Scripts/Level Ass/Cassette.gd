extends Area2D

export var ID = "Lvl0_00"

export var int_mode = false

onready var audio_collected = get_node("Collected")

func ready():
	if FreeAccessInfo.shrodingers_cassette(ID):
		queue_free()
	pass

func _on_Cassette_area_entered(area):
	audio_collected.play()
	queue_free()
	if int_mode:
		FreeAccessInfo.add_casset(1)
	else:
		pass
	pass # Replace with function body.
