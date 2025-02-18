extends Area2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")

@onready var label: Label = $Label
var player_in_area: bool = false

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"O que está fazendo, Ana?",
		"tittle":"Sofia"
	},
	
	1: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Estou tentando solucionar o mistério da sala secreta, Sofia!",
		"tittle":"Ana"
	},
	2: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Nossa! Parece bem divertido...",
		"tittle":"Sofia"
	},
	
	3: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Eu queria poder te ajudar, mas estou com dificuldade na tarefa de matemática...",
		"tittle":"Sofia"
	},
	
	4: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Então EU posso te ajudar Sofia!",
		"tittle":"Ana"
	},
	
}

var _next_dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Muito obrigada !",
		"tittle":"Sofia"
	},
	
}

@export_category("Objects")
@export var _hud: CanvasLayer = null


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:

		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_new_dialog.connect("dialog_finished", Callable(self, "_on_dialog_finished"))  # Passa o próximo diálogo
		_hud.add_child(_new_dialog)
		
func _on_dialog_finished():
	get_tree().change_scene_to_file("res://Cenas/pergunta1.tscn")
	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "     Pressione [E] 
		para falar com Sofia"


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
