extends CharacterBody2D
class_name Player_Body
@onready var movement_2d: Movement_2D = $"Movement 2D"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var weapon_holder: Weapon_Holder = $Marker2D/Weapon_Holder
@onready var movement_particles: GPUParticles2D = $MovementParticles

func Input_Process():
#region Momement Inputs
	var xmove = Input.get_action_strength("right") - Input.get_action_strength("left") 
	var ymove = Input.get_action_strength("down") - Input.get_action_strength("up") 
	var movement = Vector2(xmove,ymove)
	return movement
#endregion

func _physics_process(delta: float) -> void:
	MoveTowardsMouse()
	if(!movement_2d.isDashing):
		velocity = movement_2d.Move(Input_Process())
	Movement_Animate()
	if Input.is_action_pressed("shoot"):
		weapon_holder.shootWeapon()
	move_and_slide()
	if(Input.is_action_just_pressed("Dash")):
		if(movement_2d.canDash):
			velocity = movement_2d.Dash(Input_Process())

func Movement_Animate():

	if(velocity != Vector2.ZERO):
		movement_particles.emitting = true
		animated_sprite_2d.flip_h = velocity.normalized().x < 0
		if(movement_2d.isDashing):
			animated_sprite_2d.play("Dash")
		else:
			animated_sprite_2d.play("Move_S")
	else:
		animated_sprite_2d.play("Idle")
		movement_particles.emitting = false
func MoveTowardsMouse():
	var mouse_position = get_global_mouse_position()
	var player_position = global_position
	var direction = (mouse_position - player_position).normalized()
	weapon_holder.current_weapon.global_position = player_position + direction * weapon_holder.weapon_radius
	weapon_holder.current_weapon.rotation = direction.angle()
