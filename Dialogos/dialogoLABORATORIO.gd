extends Area2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")

@onready var label: Label = $Label
var player_in_area: bool = false
@onready var planta: Area2D = $"../../Planta"

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/perfilProfessoraAna.ase",
		"dialog":"Veja como fica um feijãozinho quando ele cresce!!!",
		"tittle":"Professora Maria"
	},
	1: {
		"faceset":"res://Assets/sprites/npc/perfilProfessoraAna.ase",
		"dialog":"Vá ate onde está o feijão que a professora plantou!",
		"tittle":"Professora Maria"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
		_on_visible_plant()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione [E] para falar"

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false

func _on_visible_plant():
	planta.visible = true
