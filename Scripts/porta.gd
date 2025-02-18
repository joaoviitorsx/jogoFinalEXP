extends Node2D

@onready var label: Label = $Area2D/Label
var player_in_area: bool = false

@export var trocaCena: String = ""  
@export var label_message: String = "" 
@export var player_next_position: Vector2 = Vector2.ZERO 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
		get_tree().change_scene_to_file(trocaCena)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = label_message

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
