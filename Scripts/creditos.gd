extends CanvasLayer


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Cenas/start_screen.tscn")
