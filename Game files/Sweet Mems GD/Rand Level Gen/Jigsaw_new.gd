extends Node2D

export var auto = false
onready var area = get_node("Area2D")

func _ready():
	if auto:
		create_prefab()
	pass


func _on_Area2D_area_entered(area):
	if not auto:
		area.queue_free()
		create_prefab()
	pass # Replace with function body.

func create_prefab():
	var pref = PrefabsList.rand_prefab()
	var prefab = load(pref).instance()
	get_parent().add_child(prefab)
	prefab.global_position = global_position
