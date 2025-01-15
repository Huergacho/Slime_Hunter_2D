extends Node
@onready var NightTimer = get_tree().get_first_node_in_group("Cycler")
@onready var slime_state_machine: State_Machine = $"../Slime_State_Machine"
var targetIsInRange : bool
var moveDirection : Vector2 = Vector2.ZERO
@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	slime_state_machine.initialize()
func ControlStates():
	if(targetIsInRange):
		UpdateDir()
		if (NightTimer.DayTime):
			slime_state_machine.ChangeState("move", -moveDirection)
		else:
			slime_state_machine.ChangeState("move", moveDirection)
	if(!targetIsInRange):
		slime_state_machine.ChangeState("idle", null)
func _process(delta : float):
	ControlStates()
func UpdateDir():
	moveDirection = player.global_position
func _on_detection_area_body_entered(body: Node2D) -> void:
	targetIsInRange = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	targetIsInRange = false
