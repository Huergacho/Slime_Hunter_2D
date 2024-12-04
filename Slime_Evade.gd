extends ME_State
class_name Evade
var move_direction : Vector2
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D" 
var isDayTime : bool = true
@onready var ray_cast_2d: RayCast2D = $"../../Raycasts/RayCast2D"
@export var obstacleDetectionDistance : float = 1
@export var avoiding_force : float = 100
func Enter():
	print("Estoy en evade")
	animated_sprite_2d.play("Chasing")
	SetTarget()
func Exit():
	fsm_owner.velocity = Vector2.ZERO
func Physic_Update(delta : float):
	if(fsm_owner):
		MoveAgainstTarget()
	if(!isDayTime):
		Change.emit(self,"chase")
func MoveAgainstTarget():
	if(target == null):
		return
	var direction = (target.global_position - fsm_owner.global_position).normalized()
	var velocity = direction * SPEED
	if (ray_cast_2d.is_colliding()):
		var obstacle_position = ray_cast_2d.get_collision_point()
		var avoid_direction = (fsm_owner.global_position - obstacle_position).normalized()
		velocity += avoid_direction * avoiding_force  # Ajusta la fuerza de evitación
	fsm_owner.velocity = velocity


func _on_detection_area_body_exited(body: Node2D) -> void:
	Change.emit(self,"idle")

func SetTarget():
	target = fsm_owner.returnHome()
