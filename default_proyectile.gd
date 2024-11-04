extends Area2D
@onready var movement_2d: Movement_2D = $"Movement 2D"
@onready var target : Vector2 = Vector2.UP
@export var piercing : int = 0
@onready var damage_area: Area2D = $Damage_Area

var initialDir :Vector2
func setCollisionLayer(value : int):
	damage_area.collision_mask = value | 8
		
func _on_ready():
	rotation = get_parent().rotation
func _process(delta: float):
	# Calcula el ángulo de la dirección
	var angle = rotation
	
	# Calcular la dirección en función del ángulo
	var direction = Vector2(cos(angle), sin(angle))
	position += direction * movement_2d.speed * delta
	#position += Vector2(cos(rotation), sin(rotation)) * movement_2d.speed * delta
	#position += delta * speed * get_global_mouse_position()
func _on_timer_timeout() -> void:
	queue_free()

func is_out_of_bounds() -> bool:
	var screen_size = get_viewport().size
	return position.x < 0 or position.x > screen_size.x or position.y < 0 or position.y > screen_size.y


func _on_damage_area_make_hit() -> void:
	if(piercing - 1 <= 0):
		queue_free()
	else:
		piercing -= 1
