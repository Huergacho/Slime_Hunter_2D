extends Area2D
class_name Enemy_Spawner
#@export var spawners: Array[PackedScene] = []
@export var spawnPoints : Array[Node2D] = []
var time = 0
enum Type{
	Once,
	Multiple
}
@export var Spawn_Time : Type
func _ready():
	if(Spawn_Time == Type.Once):
		SpawnEnemies()
#func _on_timer_timeout():
	#time+=1
	#var enemy_Spawns = spawners
	#for i in enemy_Spawns:
		#if(time >= i.time_start and time <= i.time_end):
			#if(i.spawn_delay_counter < i.spawn_delay):
				#i.spawn_delay_counter += 1
			#else:
				#i.spawn_delay_counter = 0
				#var newEnemy = i.enemy
				#var counter = 0
				#while (counter < i.enemy_quantity):
					#var enemySpawn = newEnemy.instantiate()
					#enemySpawn.global_position = get_random_position()
					#add_child(enemySpawn)
					#counter += 1
func SpawnEnemies():
	for i in spawnPoints:
		if()
func get_random_position():
	var vpr = get_viewport_rect().size * randf_range(1.1,1.4)
	#var vpr = get_viewport_rect().size * randf_range(1.1,1.4)
	#var top_left = Vector2(player.global_position.x - vpr.x / 2 ,player.global_position.y - vpr.y / 2 )
	#var top_right = Vector2(player.global_position.x + vpr.x / 2 ,player.global_position.y - vpr.y / 2 )
	#var bottom_right = Vector2(player.global_position.x + vpr.x / 2 ,player.global_position.y + vpr.y / 2 )
	#var bottom_left = Vector2(player.global_position.x - vpr.x / 2 ,player.global_position.y + vpr.y / 2 )
	#
	#var pos_side = ["up","down","right","left"].pick_random()
	#var spawn_pos1 = Vector2.ZERO
	#var spawn_pos2 = Vector2.ZERO
	#
	#match pos_side:
		#"up":
			#spawn_pos1 = top_left
			#spawn_pos2 = top_right
		#"down":
			#spawn_pos1 = bottom_left
			#spawn_pos2 = bottom_right
		#"right":
			#spawn_pos1 = top_right
			#spawn_pos2 = bottom_right
		#"left":
			#spawn_pos1 = top_left
			#spawn_pos2 =  bottom_left
	#
	#var x_spawn  = randf_range(spawn_pos1.x,spawn_pos2.x)
	#var y_spawn  = randf_range(spawn_pos1.y,spawn_pos2.y)
	#return Vector2(x_spawn,y_spawn)
