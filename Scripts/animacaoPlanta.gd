extends Area2D

@onready var label: Label = $Label
var player_in_area: bool = false
@onready var animacao: CanvasLayer = $animacao
@onready var direcional2: CanvasLayer = $"../Direcional2"

func _ready() -> void:
	animacao.visible = false
	direcional2.visible = false
	var animated_sprite = animacao.get_node("AnimatedSprite2D")
	if animated_sprite and animated_sprite is AnimatedSprite2D:
		animated_sprite.connect("animation_finished", Callable(self, "_on_animated_sprite_2d_animation_finished"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_area:
		animated_planta()
		label.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true
		label.visible = true
		label.text = "Pressione [E] para visualizar"

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = false
		label.visible = false

func animated_planta():
	print("Ativando animação da planta...")
	animacao.visible = true
	var animated_sprite = animacao.get_node("AnimatedSprite2D")
	if animated_sprite and animated_sprite is AnimatedSprite2D:
		animated_sprite.play("feijao")
func start_direcional_timer():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5 
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_direcional_timer_timeout"))
	timer.start()

func _on_direcional_timer_timeout():
	print("Ocultando Direcional.")
	direcional2.visible = false
	visible = false
	

func _on_animated_sprite_2d_animation_finished() -> void:
	print("Animação concluída. Ocultando o nó animacao.")
	animacao.visible = false
	direcional2.visible = true
