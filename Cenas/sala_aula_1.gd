extends Node

@onready var porta: Node2D = $Porta

# Called when the node enters the scene tree for the first time.
func _ready():
	set_porta_interactable(false)

func set_porta_interactable(interactable: bool):
	if porta.has_method("set_pickable"):  # Verifica se é um nó com suporte a interação
		porta.set_pickable(interactable)
	else:
		porta.set_process(interactable)  # Alternativa para outros nós
