extends Base_Weapon
class_name Default_Meele

@onready var proyectile = preload("res://Own/Prefabs/Proyectiles/meele_proyectile.tscn")
@onready var bullet_spawn_point: Node2D = $BulletSpawnPoint

func DoAction():
	var newProyectile = proyectile.instantiate()
	add_child(newProyectile)
	newProyectile.call_deferred("setCollisionLayer",attackLayers)
	if(bullet_spawn_point == null):
		bullet_spawn_point = get_node("%BulletSpawnPoint")
	newProyectile.position = bullet_spawn_point.global_position
	ammo -= 1
	PlaySwingAnimation()
func PlaySwingAnimation():
	pass
