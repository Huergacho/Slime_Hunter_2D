extends Node2D
@export var spawnedCharacter : PackedScene
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer

func _ready() -> void:
	animated_sprite_2d.play("Spawn")
	timer.start(randf_range(0.2,3))
	print(timer.wait_time)

func OnSpawn():
	var spawned = spawnedCharacter.instantiate()
	add_sibling(spawned)
	spawned.global_position = global_position
	queue_free()

func _on_timer_timeout() -> void:
	OnSpawn()
