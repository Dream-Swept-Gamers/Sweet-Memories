extends Node

var network = NetworkedMultiplayerENet.new()
var ip = "127.0.0.1"
#var ip = "192.168.0.1"
var port = 1909

func _ready():
	pass
	#ConnectToServer()

func ConnectToServer():
	network.create_client(ip, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_failed", self, "_OnConnectionFailed")
	network.connect("connection_succeeded", self, "_OnConnectionSucceeded")


func _OnConnectionFailed():
	print("Failed to connect")


func _OnConnectionSucceeded():
	print("Successfully connected")

#Note:
#All data that originated on server must be prefixed with rm_
#rm stands for Remote

#Debug Functions
remote func ServerDebugPrint(message):
	print("\nServer Says: " + message + "\n")

#--Player Functions--#

func FetchPlayerInfo(requester):
	print("Requesting Sprite")
	rpc_id(1, "FetchPlayerInfo", requester)

remote func ReturnPlayerInfo(rm_sprite, rm_name, requester):
	print("Rerieved info from Server")
	instance_from_id(requester).Recieve_Info(rm_sprite, rm_name)
