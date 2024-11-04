extends Node2D
@onready var currentLife : int = 3
@export var maxLife : int = 3
signal updateValue(curr : int, max : int)
signal hit
signal die

func _ready():
	currentLife = maxLife
	updateValue.emit(currentLife,maxLife)

#func _process(delta: float) -> void:
	#if(Input.is_key_pressed(KEY_K)):
		#recieveDamage(1)
	#if(Input.is_key_pressed(KEY_H)):
		#Heal(1)
func recieveDamage(damage : int):
	if(currentLife - damage <= 0):
		Die()
	else:
		currentLife -= damage
		hit.emit()
	UpdateValue()

func Heal(value : int):
	if(currentLife + value > maxLife):
		currentLife = maxLife
	else:
		currentLife += value
	UpdateValue()

func UpdateValue():
	updateValue.emit(currentLife,maxLife)
func Die():
	die.emit()
