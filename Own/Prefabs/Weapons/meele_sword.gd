extends Default_Meele
class_name Sword
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func PlaySwingAnimation():
	animation_player.play("new_animation")
