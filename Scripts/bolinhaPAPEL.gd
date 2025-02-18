extends Area2D

var player_in_area: bool = false
var collected = false

@export var item_name: String = "Bolinha"
@export var canvas_layer_path: NodePath = "/root/SalaDeAula/CanvasLayer2"

@onready var box1: Sprite2D = $"../../../CanvasLayer2/Quest/ColorRect/ColorRect/box1"
@onready var boxS1: Sprite2D = $"../../../CanvasLayer2/Quest/ColorRect/ColorRect/boxS1"
@onready var label: Label = $Label

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact") and not collected:
		collected = true
		print("Sinal emitido para: " , name)
		
		# Notifica o CanvasLayer que o item foi coletado
		var canvas_layer = get_node(canvas_layer_path)
		if canvas_layer and canvas_layer.has_method("on_item_collected"):
			canvas_layer.on_item_collected()
		queue_free()

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione [E] para pegar"

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		label.visible = false
		
