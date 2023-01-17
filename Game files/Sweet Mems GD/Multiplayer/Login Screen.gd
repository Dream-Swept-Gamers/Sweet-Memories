extends Control

onready var username_input = get_node("ColorRect/VBoxContainer/Username")
onready var userpassword_input = get_node("ColorRect/VBoxContainer/Password")
onready var login_button = get_node("ColorRect/VBoxContainer/Login")

func _on_Login_pressed():
	if username_input.text == "" or userpassword_input.text == "":
		#Popup
		print("Please provide valid login credentials")
	else:
		login_button.disabled = true
		var username = username_input.get_text()
		var password = userpassword_input.get_text()
		print("attempting login")
		Gateway.ConnectToServer(username, password)
