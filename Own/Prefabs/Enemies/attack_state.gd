extends State
class_name Attack_State
var AttackCooldown : float = 0.3
@onready var weapon_holder: Weapon_Holder = $"../../Weapon_Holder"
@onready var attack_cooldown: Timer = $AttackCooldown
var target : CharacterBody2D
@export var fsm_owner : CharacterBody2D
@onready var hasLeft : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var attackColor : Color
func Enter():
	
	weapon_holder.visible = true
	SetTarget()
	attack_cooldown.start()
	hasLeft = false
	fsm_owner.velocity = Vector2.ZERO
	
func Exit():
	weapon_holder.visible = false

func _on_attack_cooldown_timeout() -> void:
	weapon_holder.shootWeapon()
	if(hasLeft):
		Change.emit(self,"chase")
func Update(delta : float):
	MoveWeapon()
	ChangeColorByAttackTime()
func ChangeColorByAttackTime():
	if(attack_cooldown.time_left > attack_cooldown.wait_time / 2):
		var colorShift = get_tree().create_tween()
		colorShift.tween_property(animated_sprite_2d, "modulate", Color.WHITE, attack_cooldown.wait_time)
	if(attack_cooldown.time_left < attack_cooldown.wait_time / 2):
		var colorShift = get_tree().create_tween()
		colorShift.tween_property(animated_sprite_2d, "modulate", attackColor, attack_cooldown.wait_time)
func MoveWeapon():
	if(target != null):
		var direction = (target.global_position - fsm_owner.global_position).normalized()
		weapon_holder.current_weapon.look_at(target.global_position)
		weapon_holder.current_weapon.global_position = fsm_owner.global_position + direction * weapon_holder.weapon_radius
func SetTarget():
	target = get_tree().get_first_node_in_group("Player")


func _on_attack_area_body_exited(body: Node2D) -> void:
	hasLeft = true
