extends CharacterBody2D
class_name Base_Enemy
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var points : int = 1
func _on_life_controller_die() -> void:
	get_tree().get_first_node_in_group("PointCounter").call_deferred("updatePoints",points)
	queue_free()

func _on_life_controller_hit() -> void:
	animated_sprite_2d.play("Damage")
	onHitActions()
	await(get_tree().create_timer(0.2).timeout)
	animated_sprite_2d.play("Idle")
func onHitActions():
	pass
