extends Node2D


@export var levels : Array[PackedScene] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#door.connect("passToNextLevel",RemoveLevel())
	var level = levels[0].instantiate()
	add_child(level)
func RemoveLevel():
	levels[0].call_deferred("queue_free()")
	levels.remove_at(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
