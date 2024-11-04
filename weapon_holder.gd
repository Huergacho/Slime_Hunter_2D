extends Node2D
class_name Weapon_Holder
enum  WeaponBla {Bow, Meele}
@export var equipped_weapons = []
@export var current_weapon : Node2D = null
@onready var fire_point: Node2D = $FirePoint
@export var targetLayer :int
# Parámetros ajustables
@export var weapon_radius : float = 2  # Distancia fija entre el jugador y el arma

func _ready() -> void:
	if(equipped_weapons.is_empty()):
		pass
	else:
		equipWeapon(equipped_weapons[0])
func addWeapon(newWeapon):
	equipped_weapons.append(newWeapon)
func equipWeapon(weapon:PackedScene):
	current_weapon  = weapon.instantiate()
	current_weapon.call_deferred("ChangeProyetileLayer",targetLayer)
	add_child(current_weapon)
	current_weapon.global_position = global_position
func shootWeapon():
	current_weapon.call_deferred("Shoot")
#func MoveWeapon(movementDir : Vector2, lookDir : float):
	##weapon_holder.current_weapon.global_position = global_position + direction * weapon_holder.weapon_radius
	#current_weapon.rotation = lookDir
	#current_weapon.global_position = movementDir * weapon_radius
