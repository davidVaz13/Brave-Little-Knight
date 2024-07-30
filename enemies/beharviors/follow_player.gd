extends Node

@export var speed: float = 1.0

var enemy: Enemy
var sprite: AnimatedSprite2D

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")
	
func _physics_process(delta: float) -> void:
	# Coletar informações das posições
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	# Anda
	enemy.velocity = input_vector * speed * 100.0
	enemy.move_and_slide()
		
	# Girar Personagem
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true
