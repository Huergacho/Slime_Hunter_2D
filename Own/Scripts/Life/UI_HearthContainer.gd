extends HBoxContainer
@export var hearth = preload("res://Own/Prefabs/Life/Hearth.tscn")
@onready var currentHearts : Array[Node]= []

func _on_life_controller_update_value(curr: int, max: int) -> void:
	if(curr < currentHearts.size()):
		RemoveHearth(curr)
	else:
		var quantityToAdd = curr - currentHearts.size()
		AddHearth(quantityToAdd)

func RemoveHearth(curr: int):
	var hearth = currentHearts[curr]
	currentHearts.remove_at(curr )
	hearth.queue_free()

func AddHearth(quantity : int ):
	for i in quantity:
		var newHeath = hearth.instantiate()
		add_child(newHeath)
		currentHearts.append(newHeath)
