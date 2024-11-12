extends Node2D
enum Class{
	Archer,
	Warrior
}
@export var player_Prefabs :Array[PackedScene]= []
@export var selectedPlayer : Class = 0
var currentPlayer : Node2D
func SpawnPlayer():
	var player_scene = player_Prefabs[selectedPlayer]
	currentPlayer = player_scene.instantiate()
	add_child(currentPlayer)

func _on_ready() -> void:
	SpawnPlayer()
