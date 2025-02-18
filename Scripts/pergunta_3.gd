extends Area2D

@onready var errado: Sprite2D = $Mesa/Errado
@onready var timer: Timer = $Timer
@onready var certo: Sprite2D = $Mesa/Certo

func _ready() -> void:
	# Garante que a imagem "errado" está invisível inicialmente
	errado.visible = false
	# Conecta o sinal do Timer ao método para ocultar a imagem "errado"
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _on_button1_pressed() -> void:
	# Mostra a imagem "errado" e inicia o Timer
	errado.visible = true
	timer.start(3)  

func _on_timer_timeout() -> void:
	# Oculta a imagem "errado"
	
	if errado.visible:
		# Se a imagem "errado" estiver visível, apenas a oculta
		errado.visible = false
	else:
		# Se a resposta estiver correta, muda a cena
		get_tree().change_scene_to_file("res://Cenas/corredor4.tscn")


func _on_button_2_pressed() -> void:
	# Mostra a imagem "errado" e inicia o Timer
	errado.visible = true
	timer.start(3)  
	


func _on_button_3_pressed() -> void:
	certo.visible = true
	timer.start(3)
	
