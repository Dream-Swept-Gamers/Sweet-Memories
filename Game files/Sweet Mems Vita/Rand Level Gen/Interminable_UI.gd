extends Control

onready var Count_String = get_node("Panel/Count")

var prefabs_completed = 0

func _ready():
	Count_String.text = str(prefabs_completed)
	FreeAccessInfo.connect("Prefab_Complete", self, "increase_count")


func increase_count():
	prefabs_completed = prefabs_completed + 1
	Count_String.text = str(prefabs_completed)
