extends Node2D

export var auto = false
onready var area = get_node("Area2D")
#onready var parent = get_parent()

func _ready():
	var parent = get_parent()
	if auto:
		create_prefab()
	#PrefabsList.connect("jigsaw_move", self, "move")
	pass


func _on_Area2D_area_entered(area):
	var parent_parent = get_parent().get_parent()
	get_parent().remove_child(self)
	parent_parent.add_child(self)
	create_prefab()
	FreeAccessInfo.Prefab_completeed()
	pass # Replace with function body.

func create_prefab():
	var pref = PrefabsList.rand_prefab()
	var prefab = load(pref).instance()
	add_child(prefab)
	#prefab.global_position = global_position
	
func move():
	global_position = PrefabsList.jigsaw_loc
