extends Node

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Cenas/start_screen.tscn")

func _on_button_quit_pressed():
	get_tree().quit()
