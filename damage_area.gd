extends Area2D
@export var damage :int = 1
signal makeHit
func _on_area_entered(area: Area2D):
	print("Entre en area")


func _on_body_entered(body: Node2D):
	if(body.find_child("LifeController")):
		body.find_child("LifeController").call_deferred("recieveDamage",damage)
	makeHit.emit()
