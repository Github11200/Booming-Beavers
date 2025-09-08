class_name ConnectionManager
extends MultiplayerSpawner

@export var player_scene: PackedScene
const PORT = 42069

func create_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	var res = peer.create_server(PORT)
	
	if res == OK:
		print("server did stuff :)")
	else:
		print("end me ", res)
	
	multiplayer.multiplayer_peer = peer

func join_server() -> void:
	var peer = ENetMultiplayerPeer.new()
	var res = peer.create_client("localhost", PORT)
	
	if res == OK:
		print("Connected!")
	else:
		print("Failed: ", res)
		
	multiplayer.multiplayer_peer = peer
