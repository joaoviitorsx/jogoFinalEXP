extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")



@onready var label: Label = $Label
var player_in_area: bool = false

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Olá, minha aluna",
		"tittle":"Professor Arthur"
	},
	
	1: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Já faz um tempo que esta escola guarda uma segredo...",
		"tittle":"Professor Arthur"
	},
	2: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Uma sala misteriosa onde estão os seus maiores desejos ! ",
		"tittle":"Professor Arthur"
	},
	
	3: {
	"faceset":"res://Assets/sprites/personagem/Person1.ase",
	"dialog":"Parece muito interessante, Professor Arthur",
	"tittle":"Ana"
	},
	
	4: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Para chegar até essa sala, você deve passar por três missões.",
		"tittle":"Professor Arthur"
	},
	
	5: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Você deverá resolver uma charada para ir até a primeira missão...",
		"tittle":"Professor Arthur"
	},
	
	6: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"AQUI ESTÁ A CHARADA...",
		"tittle":"Professor Arthur"
	},
	7: {
		"faceset":"res://Assets/sprites/npc/perfilProfessorArthur.ase",
		"dialog":"Lugar cheio de frascos e soluções, Onde misturam-se ideias e experimentações. Se quiser aprender com precisão, Traga seu jaleco e sua curiosidade à mão.",
		"tittle":"Professor Arthur"
	},
	
	8: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Vou achar esse lugar!",
		"tittle":"Ana"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "   Pressione [E] 
		para falar com Professor"


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
		
