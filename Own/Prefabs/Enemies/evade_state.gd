extends State
class_name Slime_Evade
var move_direction : Vector2
@export var chase_speed : float = 1
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
var target : CharacterBody2D
@onready var navigation_agent_2d: NavigationAgent2D = $"../../NavigationAgent2D"
@export var detectionRadius = 10
@onready var path_refresh_rate: Timer = $PathRefreshRate
@onready var isDayTime : bool = true
func Enter():
	if(target == null):
		SetTarget()
	animated_sprite_2d.play("Chasing")
	path_refresh_rate.start()
func Physic_Update(delta : float):
	if(fsm_owner):
		MoveTowardsTarget()
func Exit():
	navigation_agent_2d.velocity = Vector2.ZERO
func MoveTowardsTarget():
	if(target == null):
		return
	var dir = fsm_owner.to_local(navigation_agent_2d.get_next_path_position()).normalized()
	fsm_owner.velocity = chase_speed * dir
func MakePath(target : CharacterBody2D):
	if(target == null):
		return
	navigation_agent_2d.target_position = target.global_position

func _on_detection_area_body_exited(body: Node2D) -> void:
	Change.emit(self,"idle")
func SetTarget():
	target = get_tree().get_first_node_in_group("Player")
func _on_path_refresh_rate_timeout() -> void:
	MakePath(target)

func _on_attack_area_set_target(body: Node2D) -> void:
	Change.emit(self,"attack")
