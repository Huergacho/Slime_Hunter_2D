extends Base_Enemy

var target : Node2D
@export var SPEED = 100
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var refresh_timer: Timer = $NavigationAgent2D/RefreshTimer
@onready var life_controller: Node2D = $HealthBar/LifeController
@onready var weapon_holder: Weapon_Holder = $Weapon_Holder
@onready var attack_timer: Timer = %"Attack Timer"
@onready var change_dir_timer: Timer = $"Change Dir Timer"
var isAttacking : bool
func _physics_process(delta: float) -> void:
	if(target):	
		MoveTowardsTarget()
		move_and_slide()
	MoveWeapon()	
		
	#IsNearPlayer()
func MoveTowardsTarget():
	if(target == null):
		return
	var dir = to_local(navigation_agent_2d.get_next_path_position()).normalized()
	velocity = SPEED * dir
func MakePath():
	if(target == null):
		return
	navigation_agent_2d.target_position = target.global_position
func _on_detection_area_set_target(body: Node2D) -> void:
	target = body
	MakePath()
func _on_refresh_timer_timeout() -> void:
	MakePath()
func MoveWeapon():
	if(target != null):
		var direction = (target.global_position - global_position).normalized()
		weapon_holder.current_weapon.look_at(target.global_position)
		weapon_holder.current_weapon.global_position = global_position + direction * weapon_holder.weapon_radius
		weapon_holder.shootWeapon()
	else:
		weapon_holder.current_weapon.global_position = global_position
		
func onHitActions():
	target = get_tree().get_first_node_in_group("Player")


func _on_attack_timer_timeout() -> void:
	pass
