extends ME_State
class_name Attack_State
var AttackCooldown : float = 0.3
@onready var weapon_holder: Weapon_Holder = $"../../Weapon_Holder"
@onready var attack_cooldown: Timer = $AttackCooldown
@onready var hasLeft : bool = false
@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@export var attackColor : Color

func Enter(args = null):
	weapon_holder.visible = true
	attack_cooldown.start()
	hasLeft = false
	fsm_owner.velocity = Vector2.ZERO
func Exit():
	weapon_holder.visible = false
	animated_sprite_2d.modulate = Color.WHITE
func _on_attack_cooldown_timeout() -> void:
	weapon_holder.shootWeapon()
func Update(delta : float):
	ChangeColorByAttackTime()
func ChangeColorByAttackTime():
	if(!hasLeft):
		if(attack_cooldown.time_left > attack_cooldown.wait_time / 2):
			var colorShift = get_tree().create_tween()
			colorShift.tween_property(animated_sprite_2d, "modulate", Color.WHITE, attack_cooldown.wait_time)
		if(attack_cooldown.time_left < attack_cooldown.wait_time / 2):
			var colorShift = get_tree().create_tween()
			colorShift.tween_property(animated_sprite_2d, "modulate", attackColor, attack_cooldown.wait_time)
		else:
			animated_sprite_2d.modulate = Color.WHITE
func MoveWeapon(target : Vector2):
	weapon_holder.current_weapon.global_position = fsm_owner.global_position + target * weapon_holder.weapon_radius
