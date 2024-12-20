extends ME_State
class_name Slime_Chase
var move_direction : Vector2
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D" 
var isDayTime : bool = true
@onready var ray_cast_2d: RayCast2D = $"../../Raycasts/RayCast2D"

@export var obstacleDetectionDistance : float = 1
@export var avoiding_force : float = 100
func Enter():
	animated_sprite_2d.play("Chasing")
	#path_refresh_rate.start()
	SetTarget()
func Exit():
	fsm_owner.velocity = Vector2.ZERO
func Physic_Update(delta : float):
	if(fsm_owner):
		MoveTowardsTarget()
	#navigation_agent_2d.velocity = Vector2.ZERO
func MoveTowardsTarget():
	if(target == null):
		return
	var direction = (target.global_position - fsm_owner.global_position).normalized()
	var velocity = direction * SPEED
	if (ray_cast_2d.is_colliding()):
		var obstacle_position = ray_cast_2d.get_collision_point()
		var avoid_direction = (fsm_owner.global_position - obstacle_position).normalized()
		velocity += avoid_direction * avoiding_force  # Ajusta la fuerza de evitación
	fsm_owner.velocity = velocity

#func MakePath(target : CharacterBody2D):
	#if(target == null):
		#return
	#navigation_agent_2d.target_position = target.global_position
	
func _on_detection_area_body_exited(body: Node2D) -> void:
	Change.emit(self,"idle")

#func _on_path_refresh_rate_timeout() -> void:
	#MakePath(target)
func SetTarget():
	target = get_tree().get_first_node_in_group("Player")
func _on_attack_area_set_target(body: Node2D) -> void:
	if(!isDayTime):
		Change.emit(self,"attack")
