extends Area2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")

@onready var label: Label = $Label
var player_in_area: bool = false

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/CARALUCAS.png",
		"dialog":"Não tenho tempo para segredos! Preciso estudar matemática.",
		"tittle":"Lucas"
	},
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "     Pressione [E] 
		para falar com Lucas"


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
