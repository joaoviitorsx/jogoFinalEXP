extends CharacterBody2D

@export var speed: float = 110

var animation_player: AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D


func _ready() -> void:
	animation_player = $sprite


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	# Verificar as entradas de movimento
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1

	# Normalizar a direção para evitar velocidade maior em diagonal
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Ajustar a velocidade e mover o personagem
	velocity = direction * speed
	move_and_slide()

	# Trocar as animações com base na direção
	if direction.x > 0:
		animation_player.play("mov_right")
	elif direction.x < 0:
		animation_player.play("mov_left")
	elif direction.y > 0:
		animation_player.play("mov_front")
	elif direction.y < 0:
		animation_player.play("mov_up")
	else:
		animation_player.play("idle")
