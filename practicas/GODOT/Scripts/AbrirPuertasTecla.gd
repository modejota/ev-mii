extends Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(_delta):
	# Abrir puerta, reproducir hacia fuera
	if Input.is_action_pressed("open_doors"):
		$AnimationPlayer.play("AbrirPuerta", -1, 1.0, false)
	# Cerrar puerta, reproducrir hacia dentro (from_end=true)
	if Input.is_action_pressed("close_doors"):
		$AnimationPlayer.play("AbrirPuerta", -1, -1.0, true)
