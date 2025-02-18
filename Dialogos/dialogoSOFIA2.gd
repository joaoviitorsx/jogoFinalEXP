extends Area2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")

@onready var label: Label = $Label
var player_in_area: bool = false
@export var canvas_layer_path: NodePath = "/root/Corredor/CanvasLayer"
var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Muito Obrigada, Ana!",
		"tittle":"Sofia"
	},
	
	1: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"De nada, Sofia!",
		"tittle":"Ana"
	},
	2: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"...",
		"tittle":"Sofia"
	},
	
	3: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"NOSSA! Quase ia me esquecendo...",
		"tittle":"Sofia"
	},
	
	4: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"O professor Arthur pediu pra você encontrar ele na sala de baixo.",
		"tittle":"Sofia"
	},
	
	5: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Você quer dizer a sala de aula?",
		"tittle":"Ana"
	},
	6: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Não!! A que fica no escuro...",
		"tittle":"Sofia"
	},
	
	7: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Ah... acho que sei onde fica. Obrigada Sofia!",
		"tittle":"Ana"
	},
	8: {
		"faceset":"res://Assets/sprites/npc/perfilSofia.png",
		"dialog":"Até logo, Ana!",
		"tittle":"Sofia"
	},
	
}



@export_category("Objects")
@export var _hud: CanvasLayer = null
static var contador = 0

func _ready() -> void:
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_new_dialog.connect("dialog_finished", Callable(self, "_on_dialog_finished"))  # Passa o próximo diálogo
	_hud.add_child(_new_dialog)
		
		
func _on_dialog_finished():
	var canvas_layer = get_node(canvas_layer_path)
	if canvas_layer and canvas_layer.has_method("on_dialog_finished"):
		canvas_layer.on_dialog_finished()
		queue_free()
		
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
