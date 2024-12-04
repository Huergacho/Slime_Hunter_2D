extends Node
class_name State
signal Change
var fsm_owner
func Enter():
	pass
func Update(delta : float):
	pass
func Physic_Update(delta : float):
	pass
func Exit():
	pass
func SetOwner(newOwner):
	fsm_owner = newOwner
