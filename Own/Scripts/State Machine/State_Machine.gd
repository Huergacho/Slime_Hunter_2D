extends Node
class_name State_Machine
@export var default_state : State
@export var states : Dictionary = {}
var current_state : State
func initialize():
	for child in get_children():
		if(child is State):
			states[child.name.to_lower()] = child
			child.Change.connect(ChangeState)
			child.call_deferred("SetOwner",get_parent())
	if(default_state):
		default_state.Enter(null)
		current_state = default_state
func ChangeState(newState_name, args):
	var newState = states.get(newState_name.to_lower())
	if(newState != current_state):
		return


	if(!newState):
		return

	if(current_state):
		current_state.Exit()
	newState.Enter(args)
	current_state = newState
	current_state.call_deferred("SetOwner",get_parent())
func _process(delta: float):
	if(current_state):
		current_state.Update(delta)
func _physics_process(delta: float) -> void:
	if(current_state):
		current_state.Physic_Update(delta)
