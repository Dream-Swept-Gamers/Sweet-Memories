extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100

var server_version = "A0.1.0"

onready var player_verification_process = get_node("PlayerVerification")
onready var player_tasks = get_node("PlayerFunctions")


func _ready():
	StartServer()
	

func StartServer():
	network.create_server(port, max_players)
	get_tree().set_network_peer(network)
	print("Server started")
	
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")


func _Peer_Connected(player_id):
	printToClient(player_id, ("Server Version: " + server_version))
	player_verification_process.start(player_id)
	print("User " + str(player_id) + " Connected")


func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")

#---Debug Functions---#
func printToClient(client_ID, message):
	rpc_id(client_ID, "ServerDebugPrint", message)

remote func FetchServerVersion():
	var player_id = get_tree().get_rpc_sender_id()
	
	pass

#---Player Functions---#
remote func FetchPlayerInfo(requester):
	var player_id = get_tree().get_rpc_sender_id()
	printToClient(player_id, "Remote Request Recieved")
	var instance_name = str(player_id)
	var players_instance = get_child(instance_name)
	
	var player_sprite = player_tasks.Get_Player_Sprite(players_instance)
	var player_name = player_tasks.Get_Player_Name(players_instance)
	rpc_id(player_id, "ReturnPlayerInfo", player_sprite, player_name, requester)
