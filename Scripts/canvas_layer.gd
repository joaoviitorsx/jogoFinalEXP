extends CanvasLayer

@export var total_items: int = 3
var collected_items: int = 0
@onready var direcional: CanvasLayer = $"../Direcional"
@onready var mesa: Node2D = $"../Mesa"
@onready var porta: Node2D = $"../Porta"

func _ready():
	direcional.visible = false 
	mesa.visible = false
	porta.visible = false
	set_porta_interactable(false)

func on_item_collected():
	collected_items += 1
	print("Itens coletados:", collected_items, "/", total_items)

	if collected_items >= total_items:
		print("Todos os itens foram coletados! Mostrando Direcional.")
		direcional.visible = true
		start_direcional_timer()

func start_direcional_timer():
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = 5 
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_direcional_timer_timeout"))
	timer.start()

func _on_direcional_timer_timeout():
	print("Ocultando Direcional.")
	direcional.visible = false
	visible = false
	_on_mesa()

func _on_mesa():
	print("mesa agora visivel")
	mesa.visible = true
	porta.visible = true
	set_porta_interactable(true)
	
func set_porta_interactable(interactable: bool):
	if porta.has_method("set_pickable"):  # Verifica se é um nó com suporte a interação
		porta.set_pickable(interactable)
	else:
		porta.set_process(interactable)  # Alternativa para outros nós
