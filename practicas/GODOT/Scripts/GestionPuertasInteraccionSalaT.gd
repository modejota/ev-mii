extends Spatial

# Para poder entrar las has tenido que abrir de antemano con la animación
# Animacion e interacción por botón no van sincronizadas
export var open = true

func toggle_door_animation(_body):
	open = !open
	
	if open:
		$Puertas/PuertaCorrederaA/AnimationPlayer.play("AbrirPuerta", -1, 1.0, false)
		$Puertas/PuertaCorrederaB/AnimationPlayer.play("AbrirPuerta", -1, 1.0, false)

	else:
		$Puertas/PuertaCorrederaA/AnimationPlayer.play("AbrirPuerta", -1, -1.0, true)
		$Puertas/PuertaCorrederaB/AnimationPlayer.play("AbrirPuerta", -1, -1.0, true)
