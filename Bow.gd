extends Base_Weapon
class_name Base_Bow
@onready var proyectile = preload("res://Own/Prefabs/Weapons/default_proyectile.tscn")
@onready var sprite_2d: Sprite2D = $Sprite2D
func DoAction():

	var newProyectile = proyectile.instantiate()
	add_child(newProyectile)
	newProyectile.position = global_position
	newProyectile.call_deferred("setCollisionLayer",attackLayers)
	ammo -= 1
	
