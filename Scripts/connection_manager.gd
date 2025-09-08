class_name ConnectionManager
extends Node

const PORT = 5000

func create_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	var res = peer.create_server(PORT)
	
	if res == OK:
		print("server did stuff :)")
	else:
		print("end me ", res)
	
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(
		func(peer_id: int) -> void:
			print(peer_id)
	)
	
	multiplayer.peer_disconnected.connect(
		func(peer_id: int) -> void:
			print(str(peer_id) + " has left the game!")
	)

func join_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	var res = peer.create_client("127.0.0.1", PORT)
	
	if res == OK:
		print("Connected!")
	else:
		print("Failed: ", res)
		
	multiplayer.multiplayer_peer = peer
