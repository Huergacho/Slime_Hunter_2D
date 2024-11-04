extends Label
var currentPoints : int
	
func updatePoints(value : int):
	currentPoints += value
	set_text(str(currentPoints))


func _on_ready() -> void:
	updatePoints(0)
# Replace with function body.
