extends ME_State
class_name Slime_Chase
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D" 
@onready var obstacle_avoidance: Node = $"../../Obstacle Avoidance"
var direction : Vector2
@onready var NightTimer = get_tree().get_first_node_in_group("Cycler")
func Enter():
	animated_sprite_2d.play("Chasing")
	SetTarget()
func Exit():
	fsm_owner.velocity = Vector2.ZERO
func Physic_Update(delta : float):
	if(fsm_owner):
		MoveTowardsTarget()
		
func MoveTowardsTarget():
	if(target == null):
		return
	if(NightTimer.DayTime):
		direction = (target.global_position + fsm_owner.global_position).normalized()
	else: 
		direction = (target.global_position - fsm_owner.global_position).normalized()
	var velocity = direction * SPEED
	
	fsm_owner.velocity = velocity + obstacle_avoidance.avoidVel
func _on_detection_area_body_exited(body: Node2D) -> void:
	Change.emit(self,"idle")

func SetTarget():
	target = get_tree().get_first_node_in_group("Player")
func _on_attack_area_set_target(body: Node2D) -> void:
	if(NightTimer.DayTime == false):
		Change.emit(self,"attack")
