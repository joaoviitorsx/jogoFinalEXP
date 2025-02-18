extends Node2D

var player_in_area: bool = false
var collected = false

@export var item_name: String = "feijao"
@export var canvas_layer_path: NodePath = "../../CanvasLayer"

@onready var label = $Area2D/Label
@onready var box3 = $"../../CanvasLayer/Quest/ColorRect/ColorRect/box3"
@onready var boxS3 = $"../../CanvasLayer/Quest/ColorRect/ColorRect/boxS3"

func _ready():
	label.visible = false
	box3.visible = true
	boxS3.visible = false

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact") and not collected:
		collected = true
		box3.visible = false
		boxS3.visible = true
		print("Sinal emitido para:", name)
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
