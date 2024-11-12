extends Base_Enemy
class_name Slime
var target : Node2D
@export var SPEED = 100

@onready var refresh_timer: Timer = $NavigationAgent2D/RefreshTimer
@onready var life_controller: Node2D = $HealthBar/LifeController
@onready var weapon_holder: Weapon_Holder = $Weapon_Holder
@onready var attack_timer: Timer = %"Attack Timer"
@onready var isWandering = false
var isAttacking : bool
func _physics_process(delta: float) -> void:
	move_and_slide()
	#if(target):	
		#MoveTowardsTarget()
		#move_and_slide()
#	MoveWeapon()	
		
	#else:
		#animated_sprite_2d.play("Idle")
		
	#IsNearPlayer()

#func _on_detection_area_set_target(body: Node2D) -> void:
	#target = body
	#MakePath()
#func _on_refresh_timer_timeout() -> void:
	#MakePath()

	#else:
		#weapon_holder.current_weapon.global_position = global_position
		#
func onHitActions():
	target = get_tree().get_first_node_in_group("Player")

#
#func _on_attack_timer_timeout() -> void:
	#pass
#
#
#func _on_change_dir_timer_timeout() -> void:
	#pass # Replace with function body.


func _on_night_set_timer_timeout() -> void:
	pass # Replace with function body.
