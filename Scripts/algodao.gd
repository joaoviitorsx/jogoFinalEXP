extends Node2D

var player_in_area: bool = false
var collected = false

@export var item_name: String = "algodao"
@export var canvas_layer_path: NodePath = "../../CanvasLayer"

@onready var label = $Area2D/Label
@onready var box2 = $"../../CanvasLayer/Quest/ColorRect/ColorRect/box2"
@onready var boxS2 = $"../../CanvasLayer/Quest/ColorRect/ColorRect/boxS2"

func _ready():
	label.visible = false
	box2.visible = true
	boxS2.visible = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact") and not collected:
		collected = true
		box2.visible = false
		boxS2.visible = true
		print("Sinal emitido para:", item_name)
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
