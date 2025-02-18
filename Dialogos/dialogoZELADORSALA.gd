extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")
@onready var label: Label = $Label
var player_in_area: bool = false
var canvas_layer_path: NodePath = "/root/SalaDeAula/CanvasLayer"
var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/veiochat.ase",
		"dialog":"Olá, Ana",
		"tittle":"Zelador Ramon"
	},
	
	1: {
		"faceset":"res://Assets/sprites/npc/veiochat.ase",
		"dialog":"Parece que com essa brincadeira da charada acabou que sobrou bastante papel jogado pela sala",
		"tittle":"Zelador Ramon"
	},
	
	2: {
		"faceset":"res://Assets/sprites/npc/veiochat.ase",
		"dialog":"Já resolveu sua charada Ana?",
		"tittle":"Zelador Ramon"
	},
	
	3: {
		"faceset":"res://Assets/sprites/personagem/Person1.ase",
		"dialog":"Já, senhor Ramon",
		"tittle":"Ana"
	},
	
	4: {
	"faceset":"res://Assets/sprites/personagem/Person1.ase",
	"dialog":"Posso lhe ajudar a limpar a sala?",
	"tittle":"Ana"
	},
	
	5: {
	"faceset":"res://Assets/sprites/personagem/Person1.ase",
	"dialog":"Estou vendo que ficou uma bagunça mesmo",
	"tittle":"Ana"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
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
		para falar com Zelador"


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
