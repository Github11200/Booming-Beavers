extends CanvasLayer


func _on_join_pressed() -> void:
	Connections.join_server()


func _on_host_pressed() -> void:
	Connections.create_server()
