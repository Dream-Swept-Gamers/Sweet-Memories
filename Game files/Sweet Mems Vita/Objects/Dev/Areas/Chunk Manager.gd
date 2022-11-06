extends Node2D

export var chunks = []

var chunk_total = 0
var chunk_to_use = 0
var chunks_to_deal_with = []

func _ready():
	chunk_total = chunks.size()
	if chunk_total <= 0:
		print("No chunks in manager!!")
	spawn_new_chunk()
	pass

func spawn_new_chunk():
	var chunk_instancing = chunks[chunk_to_use].instance()
	var new_chunk = self.add_child(chunk_instancing)
	chunks_to_deal_with.append(chunk_instancing)
	chunk_to_use += 1

func remove_last_chunk():
	var chunk_to_remove = chunks_to_deal_with[0]
	chunk_to_remove.queue_free()
	chunks_to_deal_with.pop_front()

func _on_Load_Next_area_entered(area):
	spawn_new_chunk()
	if chunks_to_deal_with.size() >= 4:
		remove_last_chunk()
	pass # Replace with function body.


func _on_Unload_Last_area_entered(area):
	remove_last_chunk()
	pass # Replace with function body.
