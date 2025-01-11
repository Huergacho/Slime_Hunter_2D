extends Node2D
class_name SpawnPoint
enum SpawnType{
	Once, Multiple
}
@export var Type : SpawnType
@export var spawnedCharacter : PackedScene
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var spawn_tick: Timer = $SpawnTick

func _ready() -> void:
	if(animated_sprite_2d != null):
		animated_sprite_2d.play("Spawn")
	SpawnEnemies()
func SpawnEnemies():
	if(Type == SpawnType.Once):
		timer.start(randf_range(0.2,1))
		spawn_tick.autostart = false
	if(Type == SpawnType.Multiple):
		spawn_tick.start()
	
func OnSpawn():
	var spawned = spawnedCharacter.instantiate()
	add_sibling(spawned)
	spawned.global_position = global_position
	spawned.call_deferred("SetHome", self)
func _on_timer_timeout() -> void:
	OnSpawn()


func _on_spawn_tick_timeout() -> void:
	OnSpawn()
