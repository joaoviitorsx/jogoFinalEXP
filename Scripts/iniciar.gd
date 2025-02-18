extends CanvasLayer


func _on_button_pressed() -> void:
	print("Botão Iniciar")
	get_tree().change_scene_to_file("res://Cenas/tutorial_screen.tscn")


func _on_button_2_pressed() -> void:
	print("Botão Creditos")
	get_tree().change_scene_to_file("res://Cenas/creditos.tscn")


func _on_button_3_pressed() -> void:
	print("Botão Sair")
	get_tree().quit()
