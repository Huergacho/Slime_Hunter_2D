extends CanvasModulate
class_name Day_Night_Cycler
@onready var night_timer: Node2D = $NightTimer
@export var nightColor : Color
@export var dayColor : Color
@export var cycleShiftTime : float
func _ready():
	night_timer.connect("isDayTime",ChangeMood)
func ChangeMood(isDay:bool):
	if(isDay):
		var colorShift = get_tree().create_tween()
		colorShift.tween_property(self, "color", dayColor, 1)
	else:
		var colorShift = get_tree().create_tween()
		colorShift.tween_property(self, "color", nightColor, 1)
