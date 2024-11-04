extends Node2D
class_name Base_Weapon
@export var damage : int = 1
@export var level : int = 0
@export var ammo : int = 0
@export var maxAmmo : int = 1
var canAttack : bool = true
@export var attack_cooldown:float = 1
@export var infiniteAmmo : bool = false
@export var attackLayers : int
func _on_ready():
	ammo = maxAmmo
	
func Shoot():
	if(canAttack && ammo > 0 || canAttack && infiniteAmmo):
		DoAction()
		EnterInCooldown()

func EnterInCooldown():
		canAttack = false
		await(get_tree().create_timer(attack_cooldown).timeout)
		canAttack = true
func DoAction():
	pass
func Reload(reloadAmmo : int):
	if(ammo + reloadAmmo > maxAmmo):
		ammo = maxAmmo
	else:
		ammo += reloadAmmo
func ChangeProyetileLayer(value : int):
	attackLayers = value
