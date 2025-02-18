extends Node2D

const _DIALOG_SCREEN: PackedScene = preload("res://Dialogos/dialog_screen.tscn")
@onready var label: Label = $Label
var player_in_area: bool = false

var _dialog_data: Dictionary = {
	0: {
		"faceset":"res://Assets/sprites/npc/veiochat.ase",
		"dialog":"Olá, Ana",
		"tittle":"Zelador Ramon"
	},
	
	1: {
		"faceset":"res://Assets/sprites/npc/veiochat.ase",
		"dialog":"Minhas costas estão doendo hoje",
		"tittle":"Zelador Ramon"
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
		label.text = "     Pressione [E] 
		para falar com Zelador"


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false
