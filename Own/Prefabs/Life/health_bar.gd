extends Control
@onready var panel: Panel = %Panel
@onready var texture_progress_bar: TextureProgressBar = $Panel/TextureProgressBar

func enableBar():
	panel.visible = true
	
func _on_life_controller_update_value(curr: int, max: int) -> void:
	if(curr != max):
		texture_progress_bar.value = (curr * 100) / max
		enableBar()
