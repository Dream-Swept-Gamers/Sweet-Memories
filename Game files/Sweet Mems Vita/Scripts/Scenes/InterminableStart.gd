extends Node2D


func _ready():
	pass


func _on_Area2D_area_entered(area):
	FreeAccessInfo.change_scene("res://Rand Level Gen/Scene Start.tscn")
