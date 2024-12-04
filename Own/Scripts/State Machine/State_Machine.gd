extends Node
class_name State_Machine
@export var default_state : State
@export var states : Dictionary = {}
var current_state : State
@onready var NightTimer = get_tree().get_first_node_in_group("Cycler")
func _ready():
	for child in get_children():
		if(child is State):
			states[child.name.to_lower()] = child
			child.Change.connect(ChangeState)
			child.call_deferred("SetOwner",get_parent())
	if(default_state):
		default_state.Enter()
		current_state = default_state
		CheckForDayTime()
func CheckForDayTime():
	if(current_state):
		print("Seteamos varialbes")
		current_state.set("IsDayTime",NightTimer.DayTime)
func ChangeState(state, newState_name):
	if(state != current_state):
		return

	var newState = states.get(newState_name.to_lower())

	if(!newState):
		return

	if(current_state):
		current_state.Exit()
	newState.Enter()
	current_state = newState
	current_state.call_deferred("SetOwner",get_parent())
	CheckForDayTime()
func _process(delta: float):
	if(current_state):
		current_state.Update(delta)
func _physics_process(delta: float) -> void:
	if(current_state):
		current_state.Physic_Update(delta)
