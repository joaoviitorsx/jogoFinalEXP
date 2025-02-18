extends Control

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Cenas/salaAula1.tscn")
