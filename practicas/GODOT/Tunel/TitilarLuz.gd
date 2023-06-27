extends Spatial

onready var animation := $AnimationPlayer

func _process(_delta : float):
	if Input.is_action_just_pressed("animacion_luces"):
		animation.play("Titilar")
