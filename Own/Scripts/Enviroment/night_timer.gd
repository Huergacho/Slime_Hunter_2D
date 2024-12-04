extends Node2D
signal isDayTime(bool)
var day_time_setter: Timer
var night_time_setter: Timer
var DayTime : bool
func _ready() -> void:
	get_Timer()
	day_time_setter.start()
	isDayTime.emit(true)
	DayTime = true
#Pasado el tiempo de noche hace que sea de día
func _on_day_time_setter_timeout() -> void:
	isDayTime.emit(false)
	DayTime = false
	print("Se hizo la noite")
	night_time_setter.start()
#Pasado el tiempo de noche hace que sea de ncohe
func _on_night_time_setter_timeout() -> void:
	isDayTime.emit(true)
	DayTime = true
	print("Se hizo el día")
	day_time_setter.start()
func get_Timer():
	day_time_setter = get_node("DayTimeSetter")
	night_time_setter = get_node("NightTimeSetter")
	
