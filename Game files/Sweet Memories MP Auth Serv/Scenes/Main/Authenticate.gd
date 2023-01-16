extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1911
var max_servers = 5

func _ready():
	StartServer()


func StartServer():
	network.create_server(port, max_servers)
	get_tree().set_network_peer(network)
	print("Authentication server started")
	
	network.connect("peer_connected", self, "_Peer_Connected")
	network.connect("peer_disconnected", self, "_Peer_Disconnected")


func _Peer_Connected(gateway_id):
	print("Gateway " + str(gateway_id) + " Connected")


func _Peer_Disconnected(gateway_id):
	print("Gateway " + str(gateway_id) + " Disconnected")


remote func AuthenticatePlayer(username, password, player_id):
	print("authentication request recieved")
	var gateway_id = get_tree().get_rpc_sender_id()
	var result
	print("Starting authentication")
	if not PlayerData.PlayerIDs.has(username):
		print("User not recognized")
		result = false
	elif not PlayerData.PlayerIDs[username].Password == password:
		print("Incorrect password")
		result = false
	else:
		print("Succesful authentication")
		result = true
	print("authentication result sent to gateway server")
	rpc_id(gateway_id, "AuthenticationResults", result, player_id)
