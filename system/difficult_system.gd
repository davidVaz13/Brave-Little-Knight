extends Node

@export var mob_spawner : MobSpawner
@export var initial_spawn_rate: float = 60.0
@export var mobs_increase_per_minute: float = 30
@export var wave_duration: float = 20.0
@export var brake_intensity: float = 0.5

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	#Linha Verde
	var spawn_rate = initial_spawn_rate + mobs_increase_per_minute * (time / 60.0)
	
	#Linha Rosa
	var sin_wave = sin((time * TAU)/ wave_duration)
	var wave_factor = remap(sin_wave, -1.0, 1.0,brake_intensity, 1)
	spawn_rate += wave_factor
	
	mob_spawner.mobs_per_minute = spawn_rate
	
	
