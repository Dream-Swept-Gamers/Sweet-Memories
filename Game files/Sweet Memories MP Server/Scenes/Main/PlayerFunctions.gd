extends Node

func Get_Player_Sprite(players_instance):
	var Player_Sprite = players_instance.player_sprite
	return(Player_Sprite)

func Get_Player_Name(players_instance):
	var Player_Name = players_instance.display_name
	return(Player_Name)
