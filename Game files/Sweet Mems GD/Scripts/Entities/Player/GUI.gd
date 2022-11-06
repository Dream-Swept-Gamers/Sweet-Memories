extends Control

@onready var cassette_no = get_node("Cassette Count/Label")


func _ready():
	FreeAccessInfo.connect("casset_change",Callable(self,"cassette_count"))
	

func cassette_count():
	#cassette_no.text = FreeAccessInfo.cassets
	pass
