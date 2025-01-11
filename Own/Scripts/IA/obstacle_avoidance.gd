extends Node
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var avoidVel : Vector2
@export var avoiding_force : float = 100
func _process(delta: float):
	CheckForCollide()
func GetVel():
	return avoidVel
func CheckForCollide():
	if (ray_cast_2d.is_colliding()):
		var obstacle_position = ray_cast_2d.get_collision_point()
		var avoid_direction = (get_parent().global_position - obstacle_position).normalized()
		avoidVel += avoid_direction * avoiding_force 
	else: 
		avoidVel = Vector2.ZERO
