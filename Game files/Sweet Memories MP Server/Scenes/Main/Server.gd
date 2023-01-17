extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100

var expected_tokens = []

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
	player_verification_process.Start(player_id)


func _Peer_Disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")
	get_node(str(player_id)).queue_free()

#---Debug Functions---#
func printToClient(client_ID, message):
	rpc_id(client_ID, "ServerDebugPrint", message)

remote func FetchServerVersion():
	var player_id = get_tree().get_rpc_sender_id()
	
	pass


func _on_TokenExpiration_timeout():
	var current_time = OS.get_unix_time()
	var token_time
	if expected_tokens == []:
		pass
	else:
		for i in range(expected_tokens.size() -1, -1, -1):
			token_time = int(expected_tokens[i].right(64))
			if current_time - token_time >= 30:
				expected_tokens.remove(i)
	print("Expected Tokens: ")
	print(expected_tokens)


func FetchToken(player_id): pass


remote func ReturnToken(token):
	var player_id = get_tree().get_rpc_sender_id()
	player_verification_process.Verify(player_id, token)


func ReturnTokenVerificatinoResults(player_id, result):
	rpc_id(player_id, "ReturnTokenVerificationResults", result)



#---Player Functions---#
remote func FetchPlayerInfo(requester):
	var player_id = get_tree().get_rpc_sender_id()
	printToClient(player_id, "Remote Request Recieved")
	var players_instance = get_node(str(player_id))
	var player_sprite = player_tasks.Get_Player_Sprite(players_instance)
	var player_name = player_tasks.Get_Player_Name(players_instance)
	rpc_id(player_id, "ReturnPlayerInfo", player_sprite, player_name, requester)
