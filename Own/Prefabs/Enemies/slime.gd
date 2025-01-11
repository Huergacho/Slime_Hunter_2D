extends Base_Enemy
class_name Slime
var target : Node2D

@onready var refresh_timer: Timer = $NavigationAgent2D/RefreshTimer
@onready var life_controller: Node2D = $HealthBar/LifeController
@onready var weapon_holder: Weapon_Holder = $Weapon_Holder
@onready var attack_timer: Timer = %"Attack Timer"
@onready var isWandering = false
@onready var Home : Node2D
var isAttacking : bool
func _physics_process(delta: float) -> void:
	move_and_slide()
func onHitActions():
	target = get_tree().get_first_node_in_group("Player")
func SetHome(newHome : Node2D):
	Home  = newHome
func returnHome():
	return Home
