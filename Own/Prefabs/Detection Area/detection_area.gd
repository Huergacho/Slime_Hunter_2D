extends Area2D
class_name Detection_Area
signal setTarget(body : Node2D)
signal bodyExited(body : Node2D)
@export var detectedGroup : String = "Player"
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group(detectedGroup):
		pass
		#print("Detectado: ", area.name, " en el grupo: ", detectedGroup)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group(detectedGroup):
		#print("Detectado: ", body.name, " en el grupo: ", detectedGroup)
		setTarget.emit(body)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group(detectedGroup):
		#print("Detectado: ", body.name, " en el grupo: ", detectedGroup)
		bodyExited.emit(body)
