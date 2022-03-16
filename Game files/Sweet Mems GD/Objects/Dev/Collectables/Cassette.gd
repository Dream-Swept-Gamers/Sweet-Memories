extends Area2D



func _on_Cassette_area_entered(area):
	FreeAccessInfo.add_casset(1)
	queue_free()
	pass # Replace with function body.
