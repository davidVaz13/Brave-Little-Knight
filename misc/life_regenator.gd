extends Node2D

@export var regenaration_amount: int = 20

@onready var area2d: Area2D = $Area2D

func _ready():
	area2d.body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var player:Player = body
		player.heal(regenaration_amount)
		player.meat_collected.emit(regenaration_amount)
		queue_free()
