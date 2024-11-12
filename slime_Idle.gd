extends State
class_name Slime_Idle
var move_direction : Vector2
@export var detectionRadius: float = 2
@export var fsm_owner : CharacterBody2D
@export_group("Wander")
@export var wander_waitTime : float
@export var wander_speed : float = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var target : CharacterBody2D
@onready var wander_time: Timer = $"Wander time"

func Enter():
	RandomWander()
	animated_sprite_2d.play("Idle")
	if(target == null):
		target = get_tree().get_first_node_in_group("Player")
	wander_time.wait_time = wander_waitTime
func RandomWander():
	move_direction = Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	print("Cambio dir")
func Physic_Update(delta : float):
	if(fsm_owner):
		fsm_owner.velocity = move_direction * wander_speed
func _on_detection_area_set_target(body: Node2D) -> void:
	Change.emit(self,"chase")


func _on_wander_time_timeout() -> void:
	RandomWander()
