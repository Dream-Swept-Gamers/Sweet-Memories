extends Control

onready var def_button = get_node("Creds")

func _ready():
	def_button.set_pressed_no_signal(true)
	def_button.set_pressed_no_signal(false)
	#DiscordScript._ready()
	pass



func _on_Creds_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")


func _on_Level_Sel_pressed():
	get_tree().change_scene("res://Scenes/Level_Sel.tscn")
