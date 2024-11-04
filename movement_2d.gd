extends Node2D
class_name Movement_2D
@export var speed : float
@export var canMove : bool = true
var canDash : bool = true
var isDashing : bool = false
@export var dashCooldown : float = 0.2
@export var dashIntensity : float = 4
@export var dashDuration : float = 0.3
func Move(direction : Vector2):
	if(canMove || !isDashing):
		return BaseMove(direction)

func BaseMove(direction : Vector2):
		var normalized_Dir = direction.normalized()
		var velocity = normalized_Dir * speed
		return velocity

func Dash(direction : Vector2):
	if(canDash):
		EnterInCooldown()
		var value = BaseMove(direction) * dashIntensity
		SetDash()
		return value
func SetDash():
		isDashing = true
		await(get_tree().create_timer(dashDuration).timeout)
		isDashing = false
func EnterInCooldown():
	canDash = false
	await(get_tree().create_timer(dashCooldown).timeout)
	canDash = true
