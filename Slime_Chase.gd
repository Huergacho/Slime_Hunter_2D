extends ME_State
class_name Slime_Move
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D" 
@onready var obstacle_avoidance: Node = $"../../Obstacle Avoidance"
@export var distance : float = 1
var direction
func Enter(args = null):
	animated_sprite_2d.play("Chasing")
	direction = args
func Exit():
	fsm_owner.velocity = Vector2.ZERO
func Update(delta : float):
	MoveTowardsTarget()
	
func MoveTowardsTarget():
	if(direction == null):
		return	
	var velocity = direction * SPEED
	fsm_owner.velocity = velocity + obstacle_avoidance.avoidVel
	
