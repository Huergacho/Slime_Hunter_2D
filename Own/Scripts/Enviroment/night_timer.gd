extends Node2D
signal isDayTime(bool)
@onready var day_time_setter : Timer = $DayTimeSetter

func _ready() -> void:
	day_time_setter.start()

#Pasado el tiempo de noche hace que sea de día
func _on_day_time_setter_timeout() -> void:
	isDayTime.emit(false)

#Pasado el tiempo de noche hace que sea de ncohe
func _on_night_time_setter_timeout() -> void:
	isDayTime.emit(true)
